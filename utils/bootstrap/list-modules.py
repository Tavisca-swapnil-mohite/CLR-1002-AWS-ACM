import json
import inquirer
import subprocess
from constants import ENVIRONMENTS


class TerraformModules:
    @staticmethod
    def list():
        with open("../../module.mapping.json") as f:
            modules = json.load(f)
            selected_modules = []
            selected_envs = []

            questions = [
                inquirer.Checkbox('module_names',
                                  message="Please select the modules from below.",
                                  choices=list(modules.keys()),
                                  ),
                inquirer.Checkbox('env',
                              message="Please select environment.",
                              choices=ENVIRONMENTS,
                              )
            ]
            answers = inquirer.prompt(questions)
            for name in answers["module_names"]:
                selected_modules.append(modules[name])

            for e in answers["env"]:
                selected_envs.append(e)

            selected_modules = ','.join(selected_modules)
            selected_envs = ','.join(selected_envs)

            subprocess.run(['python', 'bootstrap.py', "-m", selected_modules, "-e", selected_envs])


TerraformModules.list()
