terraform {
  required_version = ">= 1.5" # Yêu cầu Terraform version mới

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0" # Sử dụng Google Provider version 5.x trở lên
    }
  }
}