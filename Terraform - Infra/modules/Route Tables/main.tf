# Route Tables
resource "aws_route_table" "rt" {
  vpc_id = var.vpc_id

  dynamic "route" {
    for_each = var.routes
    content {
      cidr_block = route.value.cidr_block
      gateway_id = var.gateway_id
    }
  }
}

