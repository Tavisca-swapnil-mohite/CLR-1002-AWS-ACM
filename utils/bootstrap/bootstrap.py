import argparse
import os
from github import Github, InputGitTreeElement, GithubException
from pathlib import Path
import inquirer
from constants import TAGS, PROVIDER, MANDATED_TAGS_VARIABLE

# initialize
parser = argparse.ArgumentParser()
DEFAULT_BRANCH = "develop"
EXAMPLES_FOLDER_PATH = '../../examples'

# define arguments
parser.add_argument('-m', '--modules', dest='modules', type=str, help='Provide module names to generate code')
parser.add_argument('-e', '--env', dest='env', type=str, help='Environment names')

# get args
args = parser.parse_args()
args.modules = [item for item in args.modules.split(',')]
args.env = [item for item in args.env.split(',')]

print(args)

arguments = [
    inquirer.Text('repo', message="Repo name to commit the modules"),
    inquirer.Text('branch', message="Branch name to commit the modules"),
    inquirer.Text('pat', message="PAT token")
]
result = inquirer.prompt(arguments)
print(result)

# use this only if cli is used
args.repo = result["repo"]
args.branch = result["branch"]
args.pat = result["pat"]
# use
print(args)


class GithubUtil():
    def __init__(self):
        g = Github(login_or_token=args.pat, verify=False)
        print(f"Authenticated as {g.get_user().login}")

        self.repo = g.get_organization("TaviscaSolutions").get_repo(args.repo)
        #self.repo = g.get_repo(f"<owner>/{args.repo}")
        branch = None

        try:
            branch = self.repo.get_branch(args.branch)
        except GithubException as e:
            if e.status == 404:
                print(e.data["message"])
                print(f"creating branch from {DEFAULT_BRANCH}...")
                sb = self.repo.get_branch(DEFAULT_BRANCH)
                branch = self.repo.create_git_ref(ref='refs/heads/' + args.branch, sha=sb.commit.sha)
                pass
        finally:
            self.branch = branch
            print(f"repo: {self.repo}, branch: {self.branch}")

    def parse_modules(self, modules):
        variables = []
        outputs = []
        main = {}

        for module in modules:
            for root, dirs, files in os.walk(f"{EXAMPLES_FOLDER_PATH}/{module}"):
                if '.terraform' in dirs:
                    dirs.remove('.terraform')  # don't visit .terraform directory

                if '.terraform.lock.hcl' in files:
                    files.remove('.terraform.lock.hcl')

                for file in files:
                    contents = Path(f"{EXAMPLES_FOLDER_PATH}/{module}/{file}").read_text()
                    if file == 'variables.tf':
                        variables.append(contents)
                    elif file == 'outputs.tf':
                        outputs.append(contents)
                    elif file == "main.tf":

                        main[module.split("/")[-1]] = contents

        variables.append(MANDATED_TAGS_VARIABLE)

        main['variables'] = '\n\n'.join(variables)
        main['outputs'] = '\n\n'.join(outputs)

        return main


    def generate_tfvars(self, variables):
        import re
        vars = list()
        # Regular expression pattern to match the strings between "variable" and "{"
        pattern = r'variable\s+"(.+?)"'
        matches = re.findall(pattern, variables)
        for match in matches:
            if match != "mandatory_tags":
                match = f'{match} = ""'
                vars.append(match)

        vars.append(TAGS)
        return '\n'.join(vars)


    def commit_files(self, envs, modules):
        trees = list()

        for e in envs:
            env_tfvars = InputGitTreeElement(
                path=f".infra/iac/{e}/terraform.auto.tfvars",
                mode="100644",
                type="blob",
                sha=self.repo.create_git_blob(content=self.generate_tfvars(modules["variables"]), encoding='utf-8').sha,
            )

            provider = InputGitTreeElement(
                path=f".infra/iac/{e}/provider.tf",
                mode="100644",
                type="blob",
                sha=self.repo.create_git_blob(content=PROVIDER, encoding='utf-8').sha,
            )
            trees.extend([env_tfvars, provider])

            for key, item in modules.items():
                blob = self.repo.create_git_blob(
                    content=item,
                    encoding='utf-8',
                )
                print(blob)

                trees.append(
                    InputGitTreeElement(
                        path=f".infra/iac/{e}/{key}.tf",
                        mode="100644",
                        type="blob",
                        sha=blob.sha,
                    )
                )

        new_tree = self.repo.create_git_tree(
            tree=trees,
            base_tree=self.repo.get_git_tree(sha=args.branch)
        )
        print(new_tree)

        commit = self.repo.create_git_commit(
            message=f"Added modules {args.modules} using bootstrap script",
            tree=self.repo.get_git_tree(sha=new_tree.sha),
            parents=[self.repo.get_git_commit(self.repo.get_branch(args.branch).commit.sha)],
        )

        ref = self.repo.get_git_ref(ref=f"heads/{args.branch}")
        print(f"committing to branch: {ref}...")
        ref.edit(sha=commit.sha)
        print("DONE")


gu = GithubUtil()
modules = gu.parse_modules(args.modules)
gu.commit_files(args.env, modules)
