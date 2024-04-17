output "output_file" {
  value = "${data.template_file.gp3encrypt_kms_file.rendered}"
}