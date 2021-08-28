    variable "token" {
      description = "Your Linode API Personal Access Token.(required)."
      default = "linode-api-token"
    }

    variable "k8s_version" {
      description = "The Kubernetes version to use for this cluster.(required)"
      default = "1.21"
    }

    variable "label" {
      description = "The unique label to assign to this cluster.(required)"
      default = "ltf-lke-cluster"
    }

    variable "region" {
      description = "The region where your cluster will be located.(required)"
      default = "us-central"
    }

    variable "pools" {
      description = "The Node Pool specifications for the Kubernetes cluster.(required)"
      default = [
        {
          type = "g6-standard-8"
          count = 3
        }
      ]
    }
