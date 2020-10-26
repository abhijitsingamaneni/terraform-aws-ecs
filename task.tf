data "aws_caller_identity" "current" {}

resource "aws_ecs_task_definition" "dev-task" {
  family                   = "ecs-task-curai-${var.env}-${var.application}"
  container_definitions    = file("${var.service_file}")
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.container_cpu
  memory                   = var.container_memory
  execution_role_arn       = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/role-ecs-${var.env}-${var.application}"
}
