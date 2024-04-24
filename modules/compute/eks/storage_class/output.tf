output "storage_class_manifest_file" {
  value = "${data.template_file.gp3encrypt_kms_file.rendered}"
}

output "storage_class_kms_key_arn" {
  value = "${module.kms_key_for_eks_cluster.mrk_cms_arn}"
}