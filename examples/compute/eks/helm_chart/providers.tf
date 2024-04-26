provider "kubernetes" {
  config_path = "~/kubeconfigs/eks-cluster.cfg"
}
provider "helm" {
  kubernetes {
    config_path = "~/kubeconfigs/eks-cluster.cfg"
  }
}