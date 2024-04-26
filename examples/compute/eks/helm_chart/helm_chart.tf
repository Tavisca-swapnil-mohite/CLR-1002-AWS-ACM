module "helm_chart" {
  source = "../../../../modules/compute/eks/helm_chart"
    cluster_name            = var.cluster_name
    aws_region              = var.aws_region  
    helm_chart_name         = var.helm_chart_name        
    helm_chart_release_name = var.helm_chart_release_name       
    helm_chart_repo         = var.helm_chart_repo  
    helm_chart_version      = var.helm_chart_version     
    namespace               = var.namespace   
}