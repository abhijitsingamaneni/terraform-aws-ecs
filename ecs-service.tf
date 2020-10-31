resource "aws_ecs_service" "ecs_service" {
  name                = "ecs-service-curai-${var.env}-${var.application}"
  desired_count       = var.desired_count
  launch_type         = "FARGATE"
  scheduling_strategy = var.scheduling_strategy
  task_definition     = "ecs-task-curai-${var.env}-${var.application}"
  cluster             = "ecs-curai-${var.env}-${var.application}"

network_configuration {
    subnets           = [var.subnets]
    security_groups   = [var.security_groups]
    assign_public_ip  = var.assign_public_ip
} 

load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }
}



