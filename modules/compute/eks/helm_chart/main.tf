###### Creating storage class manifest file ######
data "template_file" "yaml-template-file" {
  template = file("${path.module}/templates/values.yaml.tpl")
  vars = {
    name       = var.helm_chart_name
    chart      = var.helm_chart_release_name
    repository = var.helm_chart_repo
    helm_chart_version = var.helm_chart_version
  }
}

###### Copying file to local module directory ######
resource "local_file" "values-yaml" {
  content = data.template_file.yaml-template-file.rendered
  filename = "${path.module}/values.yaml"
}

resource "helm_release" "cluster_autoscaler" {
  depends_on = [var.mod_dependency, kubernetes_namespace.cluster_autoscaler , local_file.values-yaml]
  count      = var.enabled ? 1 : 0
  name       = var.helm_chart_name
  chart      = var.helm_chart_release_name
  repository = var.helm_chart_repo
  version    = var.helm_chart_version
  namespace  = var.namespace
  
  /* This will be needed when overriding variables from values file
  values = [
    "${file("values.yaml")}"
  ]
  */

  set {
    name  = "autoDiscovery.clusterName"
    value = var.cluster_name
  }

  set {
    name  = "awsRegion"
    value = var.aws_region
  }

  set {
    name  = "podAnnotations.iam\\.amazonaws\\.com/role"
    value = "${var.cluster_name}-utilities-cluster-autoscaler"
  }


}