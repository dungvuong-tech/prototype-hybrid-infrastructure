# 1. Bucket chứa Dữ liệu Training (Data Lake)
resource "google_storage_bucket" "data_bucket" {
  name          = "${var.project_id}-ml-data" # Tên bucket phải unique toàn cầu
  location      = var.region
  force_destroy = false # Ngăn chặn xóa nhầm nếu bucket có dữ liệu

  uniform_bucket_level_access = true # Bắt buộc dùng IAM để quản lý quyền (Best Practice)

  versioning {
    enabled = true # Bật versioning để không mất dữ liệu cũ
  }

  depends_on = [google_project_service.apis]
}

# 2. Bucket chứa Model đã train xong (Model Registry dạng file)
resource "google_storage_bucket" "model_bucket" {
  name          = "${var.project_id}-ml-models"
  location      = var.region
  force_destroy = false

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  depends_on = [google_project_service.apis]
}

# Output tên bucket để cấu hình vào biến môi trường của App sau này
output "model_bucket_name" {
  value = google_storage_bucket.model_bucket.name
}