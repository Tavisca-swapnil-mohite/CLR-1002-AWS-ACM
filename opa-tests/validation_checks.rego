package terraform
import input

deny[reason] {
        resource = input.resource_changes[_]
        resource.type == "aws_s3_bucket_acl"
        contains(resource.change.after.acl,"public")
        reason := "Bucket should not be public"
}

deny[reason] {
        resource = input.resource_changes[_]
        resource.type == "aws_s3_bucket"
        resource.change.after_unknown.server_side_encryption_configuration != true
        reason := "Bucket should have encryption enabled"
}
deny[reason] {
        some val
        module_source := input.configuration.root_module.module_calls[val].source
        not contains(module_source, "cxloyalty")
        reason := "External modules should not be referenced"
}
