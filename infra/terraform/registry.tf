resource "google_artifact_registry_repository" "app_repo" {
  location      = var.region
  repository_id = "app-repo"
  description   = "Docker repository for Application images"
  format        = "DOCKER"

  # Đảm bảo API đã được bật trước khi tạo repo
  depends_on = [google_project_service.apis]
}

# Output URL của repo để dùng trong GitHub Actions sau này
output "artifact_registry_url" {
  value = "${var.region}-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.app_repo.name}"
}