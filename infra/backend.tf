terraform {
  backend "s3" {
    bucket         = "meu-app-terraform-state"
    key            = "state/${var.app_name}/terraform.tfstate"
    region         = var.aws_region
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
  }
}
