module "storage_class" {
  source = "../../../../modules/compute/eks/storage_class"
    kms_alias             = var.kms_alias
    delete_after_days     = var.delete_after_days
    key_description       = var.key_description
    key_policy_statements = var.key_policy_statements
    tags                  = var.tags
}