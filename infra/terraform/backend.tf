terraform {
  backend "gcs" {
    # Tên bucket bạn đã tạo thủ công ở Hành động 5
    bucket  = "tf-state-prototype-cicd-mlops"
    # Đường dẫn lưu file state trong bucket
    prefix  = "terraform/state"
  }
}