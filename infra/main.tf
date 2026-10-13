terraform {
  required_version = ">= 1.14, < 2.0"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "= 3.3.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_job_v1" "app_smoke_test" {
  metadata {
    name      = "devops-cicd-portfolio"
    namespace = "default"
  }

  spec {
    backoff_limit = 0

    template {
      metadata {
        labels = {
          app = "devops-cicd-portfolio"
        }
      }

      spec {
        container {
          name              = "app"
          image             = "devops-cicd-portfolio:ci"
          image_pull_policy = "Never"

          security_context {
            allow_privilege_escalation = false
            run_as_non_root            = true
            run_as_user                = 10001

            capabilities {
              drop = ["ALL"]
            }
          }
        }

        restart_policy = "Never"
      }
    }
  }
}