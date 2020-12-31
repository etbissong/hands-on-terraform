resource "random_string" "random" {
  length = 16
  special = false
  upper = false
}

resource "google_storage_bucket" "static-site" {
  name          = "${var.bucket_name}-${random_string.random.result}"
  location      = var.bucket_location
  force_destroy = true

  uniform_bucket_level_access = true

  website {
    main_page_suffix = var.home_page
    not_found_page   = var.error_page
  }
  cors {
    origin          = ["https://storage.googleapis.com/${var.bucket_name}-${random_string.random.result}.com"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}