resource "aws_ecs_service" "nginx" {
  name                = "nginx-demo"
  desired_count       = 3
  launch_type         = "FARGATE"
  scheduling_strategy = "REPLICA"
  task_definition     = "ecs-task-curai-${var.env}-${var.application}"
  cluster             = "ecs-curai-${var.env}-${var.application}"

network_configuration {
    subnets           = ["subnet-0f209345c217321a3"]
    security_groups   = ["sg-0b7e9b66d86703bb4"]
    assign_public_ip  = "true"
} 

load_balancer {
    target_group_arn = "arn:aws:elasticloadbalancing:us-west-2:501611955209:targetgroup/test/7978436f7f8d3f6d"
    container_name   = "web"
    container_port   = 80
  }
}



