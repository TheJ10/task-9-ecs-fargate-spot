resource "aws_ecr_repository" "strapi" {
  name = "jaspal-task8-strapi"

  image_scanning_configuration {
    scan_on_push = true
  }

  force_delete = true
}
