###### Creating KMS key using existing module ######
module "kms_key_for_eks_cluster" {
  source                = "../../../security/kms"
  kms_alias             = var.kms_alias
  delete_after_days     = var.delete_after_days
  key_description       = var.key_description
  key_policy_statements = var.key_policy_statements
  tags              = var.tags
}

###### Creating storage class manifest file ######
data "template_file" "gp3encrypt_kms_file" {
  template = file("${path.module}/templates/gp3encrypt_kms_added_sc.json.tpl")
  vars = {
    AppName             = var.tags.AppName
    Backup              = var.tags.Backup
    BusinessUnit        = var.tags.BusinessUnit
    DataClassification  = var.tags.DataClassification
    Environment         = var.tags.Environment
    InfraOwner          = var.tags.InfraOwner
    Name                = var.tags.Name
    Product             = var.tags.Product 
    kmsKeyId            = module.kms_key_for_eks_cluster.mrk_cms_arn
  }
}

###### Copying file to local module directory ######
resource "local_file" "gp3encrypt_kms_file_json" {
  content = data.template_file.gp3encrypt_kms_file.rendered
  filename = "${path.module}/gp3encrypt_kms_file.json"
}

###### Create storage class ######
resource "kubernetes_manifest" "storage_class" {
  manifest  = jsondecode(file("${path.module}/gp3encrypt_kms_file.json"))
  depends_on = [
    local_file.gp3encrypt_kms_file_json
  ]
}
