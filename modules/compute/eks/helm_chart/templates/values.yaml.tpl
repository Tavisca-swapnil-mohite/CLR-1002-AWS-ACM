awsRegion: us-east-1
autoDiscovery:
  clusterName: "eks-pci-prod"
image:
  repository: 434934963682.dkr.ecr.us-east-1.amazonaws.com/k8s-utilities-images/cluster-autoscaler
  tag: v1.25.0
## Role should have following policies attached
## autoscaling:DescribeAutoScalingGroups
## autoscaling:DescribeAutoScalingInstances
## autoscaling:DescribeLaunchConfigurations
## autoscaling:DescribeTags
## autoscaling:SetDesiredCapacity
## autoscaling:TerminateInstanceInAutoScalingGroup
podAnnotations:
  ## This annotation is set during helm install command
  # iam.amazonaws.com/role: EKS_UTILITIES_CLUSTER_AUTOSCALER
  prometheus.io/scrape: "true"
  prometheus.io/port: "8085"
sslCertHostPath: /etc/kubernetes/pki/ca.crt
# env vars to redirect to squid proxy
extraEnv:
  http_proxy: http://squid.secure.cnxloyalty.com:3582
  https_proxy: http://squid.secure.cnxloyalty.com:3582
  no_proxy: 172.20.0.0/16,169.254.169.254,localhost,.secure.cnxloyalty.com
rbac:
  # rbac.create -- If `true`, create and use RBAC resources.
  create: true
  # rbac.pspEnabled -- If `true`, creates and uses RBAC resources required in the cluster with [Pod Security Policies](https://kubernetes.io/docs/concepts/policy/pod-security-policy/) enabled.
  # Must be used with `rbac.create` set to `true`.
  pspEnabled: false
  serviceAccount:
    # rbac.serviceAccount.annotations -- Additional Service Account annotations.
    annotations:
      # rbac.serviceAccount.create -- If `true` and `rbac.create` is also true, a Service Account will be created.
      eks.amazonaws.com/role-arn: arn:aws:iam::434934963682:role/eks-pci-prod-utilities-cluster-autoscaler
    create: true
    # rbac.serviceAccount.name -- The name of the ServiceAccount to use. If not set and create is `true`, a name is generated using the fullname template.
    name: ""
    # rbac.serviceAccount.automountServiceAccountToken -- Automount API credentials for a Service Account.
    automountServiceAccountToken: true
replicaCount: 2
# Commented resource block as in existing setup its removed
# resources:
#   limits:
#     memory: 200Mi
#   requests:
#     memory: 150Mi
extraArgs:
  stderrthreshold: warning
  v: 2
  logtostderr: true 
  balance-similar-node-groups: true 
  leader-elect: false
  