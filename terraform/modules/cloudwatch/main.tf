resource "aws_cloudwatch_log_group" "strapi" {
  name = "/ecs/jaspal-task8-strapi"
  retention_in_days = 7
}

#####
resource "aws_cloudwatch_dashboard" "ecs_dashboard" {
  dashboard_name = "jaspal-task8-ecs-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type  = "metric"
        x     = 0
        y     = 0
        width = 12
        height = 6

        properties = {
          metrics = [
            ["AWS/ECS", "CPUUtilization", "ClusterName", var.cluster_name, "ServiceName", var.service_name],
            ["AWS/ECS", "MemoryUtilization", "ClusterName", var.cluster_name, "ServiceName", var.service_name]
          ]
          stat   = "Average"
          period = 300
          region = var.region
          title  = "CPU & Memory Utilization"
        }
      },
      {
        type  = "metric"
        x     = 12
        y     = 0
        width = 12
        height = 6

        properties = {
          metrics = [
            ["AWS/ECS", "NetworkIn", "ClusterName", var.cluster_name, "ServiceName", var.service_name],
            ["AWS/ECS", "NetworkOut", "ClusterName", var.cluster_name, "ServiceName", var.service_name]
          ]
          stat   = "Sum"
          period = 300
          region = var.region
          title  = "Network In / Out"
        }
      },
      {
        type  = "metric"
        x     = 0
        y     = 6
        width = 12
        height = 6

        properties = {
          metrics = [
            ["AWS/ECS", "RunningTaskCount", "ClusterName", var.cluster_name, "ServiceName", var.service_name]
          ]
          stat   = "Average"
          period = 300
          region = var.region
          title  = "Running Task Count"
        }
      }
    ]
  })
}