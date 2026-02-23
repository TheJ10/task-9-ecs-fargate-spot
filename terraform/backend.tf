terraform {
  backend "s3" {
    bucket = "jaspal-task9-terraform-state"
    key    = "task9/terraform.tfstate"
    region = "us-east-1"
  }
}
