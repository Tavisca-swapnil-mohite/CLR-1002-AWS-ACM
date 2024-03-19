## The project contains validation rules defined in open policy framework and would be used against the Terraform plan to run the predefined checks.

Command

**./opa eval --format pretty -i ${path to the TF plan json} --data validation_checks.rego data.terraform.deny **

###### where opa is the executable for open policy agent and should be present on the machine.

