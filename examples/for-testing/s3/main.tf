module "my_s3_module" {
    source = "git::https://github.com/TaviscaSolutions/central-iac//modules/for-testing/s3?ref=bootstrap-utility-enhancements"
    #source = "../../modules/s3"
    bucket_name = var.bucket_name
    bucket_acl = var.bucket_acl
    enable_versioning = var.enable_versioning
    resource_based_policy = var.resource_based_policy
}