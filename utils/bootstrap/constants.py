ENVIRONMENTS = [
    "travelclient-qa",
    "travelclient-stage",
    "travelclient-prod",
    "travel-qa",
    "travel-stage",
    "travel-prod",
    "pci-qa",
    "pci-stage",
    "pci-prod",
    "cx-travel-poc-appdr"
]

TAGS = """
mandatory_tags = {
    AppName = ""
    Backup = ""
    DataClassification = ""
    InfraOwner = ""
    Product = ""
    BusinessUnit = ""
    Environment = ""
}
"""

PROVIDER = """
provider "aws" {
    region = "us-east-1"
    default_tags {
        tags = merge(var.mandatory_tags, { ResourceGroup = "${var.mandatory_tags.Product}-${var.mandatory_tags.AppName}"})
    }
}
"""

MANDATED_TAGS_VARIABLE = """
variable "mandatory_tags" {
    type = map(string)
} 
"""