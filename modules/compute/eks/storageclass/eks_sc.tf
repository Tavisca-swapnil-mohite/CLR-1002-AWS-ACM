data "aws_kms_key" "eks-ebs-encrypt-key" {
  key_id = var.kmskeyid
}

data "template_file" "gp3encrypt_kms_file" {
  template = file("${path.module}/gp3encrypt_kms_added_sc.json.tpl")
  vars = {
    BusinessUnit = var.tags.BusinessUnit
    Environment  = var.tags.Environment
    Name         = var.tags.Name
    kmsKeyId     = data.aws_kms_key.eks-ebs-encrypt-key.arn
  }
}

resource "local_file" "gp3encrypt_kms_file_json" {
  content = data.template_file.gp3encrypt_kms_file.rendered
  filename = "${path.module}/gp3encrypt_kms_file.json"
}
