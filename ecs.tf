resource "aws_ecs_cluster" "ecs" {
  name = "ecs-curai-${var.env}-${var.application}"
}