# Cấu hình Provider Google
provider "google" {
  project = var.project_id
  region  = var.region
}

# Khai báo các biến đầu vào (sẽ được truyền từ CI/CD hoặc file .tfvars)
variable "project_id" {
  description = "The ID of the GCP project"
  type        = string
}

variable "region" {
  description = "The default GCP region for resources"
  type        = string
  default     = "us-central1"
}