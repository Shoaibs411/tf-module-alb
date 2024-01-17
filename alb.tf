# Creates ALB
resource "aws_lb" "alb" {
  name               = var.ALB_NAME
  internal           = var.INTERNAL
  load_balancer_type = "application"
  security_groups    = If var.INTERNAL=true (private-securityGroup) else (public-securityGroup)
  subnets            = If var.INTERNAL=true (private-subnets) else (public-subnets)

  enable_deletion_protection = false

  tags = {
    Name = var.ALB_NAME
  }
}


