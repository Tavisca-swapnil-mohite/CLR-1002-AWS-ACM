{
    "allowVolumeExpansion": true,
    "apiVersion": "storage.k8s.io/v1",
    "kind": "StorageClass",
    "metadata": {
        "annotations": {
            "storageclass.kubernetes.io/is-default-class": "true"
        },
        "name": "gp3encrypt"
    },
    "parameters": {
        "csi.storage.k8s.io/fstype": "ext4",
        "encrypted": "true",
        "tagSpecification_1": "Product=plt",
        "tagSpecification_2": "AppName=eks",
        "tagSpecification_3": "InfraOwner=cloud_oak@cxloyaltycorp.com",
        "tagSpecification_4": "DataClassification=highlycritical",
        "tagSpecification_5": "Backup=no",
        "tagSpecification_6": "BusinessUnit=${BusinessUnit}",
        "tagSpecification_7": "Environment=${Environment}",
        "tagSpecification_8": "Name=${Name}",        
        "type": "gp3",
        "kmsKeyId":"${kmsKeyId}"
    },
    "provisioner": "ebs.csi.aws.com",
    "reclaimPolicy": "Delete",
    "volumeBindingMode": "WaitForFirstConsumer"
}
