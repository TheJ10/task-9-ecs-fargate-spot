module "ecs_jaspal_task9" {
  source = "./modules/ecs"
  image_tag           = var.image_tag
  ecr_repository_url = module.ecr_jaspal_task9.repository_url
  execution_role_arn = var.execution_role_arn
  aws_region     = var.aws_region
  db_host     = module.rds_jaspal_task9.db_endpoint
  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}

module "rds_jaspal_task9" {
  source     = "./modules/rds"
  subnet_ids = var.subnet_ids

  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}

module "ecr_jaspal_task9" {
  source = "./modules/ecr"
}
