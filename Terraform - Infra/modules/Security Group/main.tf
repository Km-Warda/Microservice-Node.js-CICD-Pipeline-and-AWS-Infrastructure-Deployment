resource "aws_security_group" "security_group" {
  vpc_id = var.vpc_id
#Ingress rules
  dynamic "ingress" {
    for_each = var.sg_ingress_rule
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
 #Egress rules
  dynamic "egress" {
    for_each = var.sg_egress_rule
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
  tags = var.tags
}