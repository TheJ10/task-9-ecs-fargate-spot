data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

resource "aws_db_subnet_group" "jaspal_task8_db_subnet_group" {
  name       = "jaspal-task8-db-subnet-group"
  subnet_ids = data.aws_subnets.default.ids
}

resource "aws_db_instance" "jaspal_task8_db" {
  identifier              = "jaspal-task8-strapi-db"
  engine                  = "postgres"
  engine_version          = "15"
  instance_class          = "db.t3.small"
  allocated_storage       = 20

  db_name                 = var.db_name
  username                = var.db_username
  password                = var.db_password

  publicly_accessible     = true
  skip_final_snapshot     = true
  deletion_protection     = false

  db_subnet_group_name    = aws_db_subnet_group.jaspal_task8_db_subnet_group.name
}
