#data "local_file" "defaults" {
#  filename = pathexpand("${path.module}/config/_defaults.yml")
#}

data "local_file" "config" {
  filename = "${path.module}/config/default.yml"
}

locals {
  config = merge(
    yamldecode(data.local_file.config.content)
  )
}
