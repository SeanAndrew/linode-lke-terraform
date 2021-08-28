# Use the Linode Provider
provider "linode" {
  token = var.token
}

# Use the linode_lke_cluster resource to create a Kubernetes cluster
resource "linode_lke_cluster" "ltf_lke" {
    label = var.label
    k8s_version = var.k8s_version
    region = var.region
    tags = var.tags

    dynamic "pool" {
        for_each = var.pools
        content {
            type  = pool.value["type"]
            count = pool.value["count"]
        }
    }
}

# Export this cluster's attributes
output "kubeconfig" {
   value = linode_lke_cluster.ltf_lke.kubeconfig
}

output "api_endpoints" {
   value = linode_lke_cluster.ltf_lke.api_endpoints
}

output "status" {
   value = linode_lke_cluster.ltf_lke.status
}

output "id" {
   value = linode_lke_cluster.ltf_lke.id
}

output "pool" {
   value = linode_lke_cluster.ltf_lke.pool
}
