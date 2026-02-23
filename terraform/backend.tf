terraform {
  backend "s3" {
    bucket = "jaspal-task8-terraform-state"
    key    = "task8/terraform.tfstate"
    region = "us-east-1"
  }
}
