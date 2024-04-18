module "storage_class" {
  source = "../../../modules/compute/eks/storage_class"
    kmskeyid              = var.kmskeyid
    key_policy_map        = var.key_policy_map
    kms_delete_after_days = var.kms_delete_after_days
    tags                  = var.tags
    AppName               = var.tags.AppName
    Backup                = var.tags.Backup
    BusinessUnit          = var.tags.BusinessUnit
    DataClassification    = var.tags.DataClassification
    Environment           = var.tags.Environment
    InfraOwner            = var.tags.InfraOwner
    Name                  = var.tags.Name
    Product               = var.tags.Product  
}