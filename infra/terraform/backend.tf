terraform {
  backend "gcs" {
    bucket  = "tf-state-prototype-cicd-mlops"
    prefix  = "terraform/state"
  }
}