
data "local_file" "config" {
  filename = "${path.module}/GlobalConfiguration/global.yml"
}

locals {
  mandate_tags = merge(
    yamldecode(data.local_file.config.content)
  )

}






