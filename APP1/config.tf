
data "local_file" "config" {
  filename = "${path.module}/config/default.yml"
}
data "local_file" "environment" {
  filename = "${path.module}/QA/environment.yml"
}


locals {
  config = merge(
    yamldecode(data.local_file.config.content),
    yamldecode(data.local_file.environment.content)
  )

}






