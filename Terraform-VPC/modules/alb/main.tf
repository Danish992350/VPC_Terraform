# ALB

resource "aws_lb" "alb" {
  name               = "application_load_balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.var.sg_id]
  subnets            = [for subnet in aws_subnet.public : subnet.id]


} 

# Listener

resource "aws_lb_listener" "Listener" {
  load_balancer_arn = aws_lb.lb.alb.arn
  port              = "80"
  protocol          = "HTTPS"
  

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

# target group

resource "aws_lb_target_group" "tg" {
  name     = "tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

# target group attachment

resource "aws_lb_target_group_attachment" "tga" {
  count = length(var.instances)  
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.instances[count.index]
  port             = 80
}

