data "aws_caller_identity" "current" {}

data "template_file" "data_task" {
    template           = "${file("${path.module}/service.tpl")}"

    vars {
        ecr_repo       = "${var.ecr_repo}"
        container_name = "${var.container_name}"
    }
}

resource "aws_ecs_task_definition" "dev-task" {
  family                   = "ecs-task-curai-${var.env}-${var.application}"
  container_definitions    = file("${path.module}/${var.service_file}")
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.container_cpu
  memory                   = var.container_memory
  execution_role_arn       = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/role-ecs-${var.env}-${var.application}"
}
