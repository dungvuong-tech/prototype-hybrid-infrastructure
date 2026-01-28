# Danh sách các API cần thiết cho dự án
locals {
  services = [
    "artifactregistry.googleapis.com", # Để chứa Docker Images
    "aiplatform.googleapis.com",       # Vertex AI (Training & Serving)
    "run.googleapis.com",              # Cloud Run (App Hosting)
    "cloudbuild.googleapis.com",       # Cloud Build
    "compute.googleapis.com",          # Compute Engine (Nền tảng chung)
    "iam.googleapis.com",              # Quản lý quyền
    "secretmanager.googleapis.com"     # Quản lý biến môi trường bảo mật
  ]
}

# Resource để kích hoạt API hàng loạt
resource "google_project_service" "apis" {
  for_each = toset(local.services)
  project  = var.project_id
  service  = each.value

  # Không tắt API khi destroy resource này (để an toàn cho dữ liệu)
  disable_on_destroy = false
}s