resource "aws_subnet" "projetofinal_subnetPub_1a" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "10.99.0.0/24"
  availability_zone = "sa-east-1a"

  tags = {
    Name = "projetofinal_subnetPub_1a"
  }
}
resource "aws_subnet" "projetofinal_subnetPub_1b" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "10.99.1.0/24"
  availability_zone = "sa-east-1b"

  tags = {
    Name = "projetofinal_subnetPub_1b"
  }
}
resource "aws_subnet" "projetofinal_subnetPub_1c" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "10.99.2.0/24"
  availability_zone = "sa-east-1c"

  tags = {
    Name = "projetofinal_subnetPub_1c"
  }
}
resource "aws_subnet" "projetofinal_subnetPriv_1a" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "10.99.10.0/24"
  availability_zone = "sa-east-1a"

  tags = {
    Name = "projetofinal_subnetPriv_1a"
  }
}
resource "aws_subnet" "projetofinal_subnetPriv_1b" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "10.99.11.0/24"
  availability_zone = "sa-east-1b"

  tags = {
    Name = "projetofinal_subnetPriv_1b"
  }
}
resource "aws_subnet" "projetofinal_subnetPriv_1c" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "10.99.12.0/24"
  availability_zone = "sa-east-1c"

  tags = {
    Name = "projetofinal_subnetPriv_1c"
  }
}

resource "aws_route_table" "projetofinal_rtPub" {
  vpc_id = "${var.vpc_id}"
  route = [
      {
        carrier_gateway_id         = ""
        cidr_block                 = "0.0.0.0/0"
        destination_prefix_list_id = ""
        egress_only_gateway_id     = ""
        gateway_id                 = "${var.igw_id}"
        instance_id                = ""
        ipv6_cidr_block            = ""
        local_gateway_id           = ""
        nat_gateway_id             = ""
        network_interface_id       = ""
        transit_gateway_id         = ""
        vpc_endpoint_id            = ""
        vpc_peering_connection_id  = ""
      }
  ]
  tags = {
    Name = "projetofinal_rtPub"
  }
}

resource "aws_route_table" "projetofinal_rtPriv1a" {
  vpc_id = "${var.vpc_id}"
  route = [
      {
        carrier_gateway_id         = ""
        cidr_block                 = "0.0.0.0/0"
        destination_prefix_list_id = ""
        egress_only_gateway_id     = ""
        gateway_id                 = ""
        instance_id                = ""
        ipv6_cidr_block            = ""
        local_gateway_id           = ""
        nat_gateway_id             = aws_nat_gateway.projetofinal_NATGW1a.id
        network_interface_id       = ""
        transit_gateway_id         = ""
        vpc_endpoint_id            = ""
        vpc_peering_connection_id  = ""
      }
  ]
  tags = {
    Name = "projetofinal_rtPriv1a"
  }
}
resource "aws_route_table" "projetofinal_rtPriv1b" {
  vpc_id = "${var.vpc_id}"
  route = [
      {
        carrier_gateway_id         = ""
        cidr_block                 = "0.0.0.0/0"
        destination_prefix_list_id = ""
        egress_only_gateway_id     = ""
        gateway_id                 = ""
        instance_id                = ""
        ipv6_cidr_block            = ""
        local_gateway_id           = ""
        nat_gateway_id             = aws_nat_gateway.projetofinal_NATGW1b.id
        network_interface_id       = ""
        transit_gateway_id         = ""
        vpc_endpoint_id            = ""
        vpc_peering_connection_id  = ""
      }
  ]
  tags = {
    Name = "projetofinal_rtPriv1b"
  }
}

resource "aws_route_table" "projetofinal_rtPriv1c" {
  vpc_id = "${var.vpc_id}"
  route = [
      {
        carrier_gateway_id         = ""
        cidr_block                 = "0.0.0.0/0"
        destination_prefix_list_id = ""
        egress_only_gateway_id     = ""
        gateway_id                 = ""
        instance_id                = ""
        ipv6_cidr_block            = ""
        local_gateway_id           = ""
        nat_gateway_id             = aws_nat_gateway.projetofinal_NATGW1c.id
        network_interface_id       = ""
        transit_gateway_id         = ""
        vpc_endpoint_id            = ""
        vpc_peering_connection_id  = ""
      }
  ]
  tags = {
    Name = "projetofinal_rtPriv1c"
  }
}

resource "aws_route_table_association" "projetofinal_rtPriv_Assoc1a" {
  subnet_id      = aws_subnet.projetofinal_subnetPriv_1a.id
  route_table_id = aws_route_table.projetofinal_rtPriv1a.id
}
resource "aws_route_table_association" "projetofinal_rtPriv_Assoc1b" {
  subnet_id      = aws_subnet.projetofinal_subnetPriv_1b.id
  route_table_id = aws_route_table.projetofinal_rtPriv1b.id
}
resource "aws_route_table_association" "projetofinal_rtPriv_Assoc1c" {
  subnet_id      = aws_subnet.projetofinal_subnetPriv_1c.id
  route_table_id = aws_route_table.projetofinal_rtPriv1c.id
}

resource "aws_route_table_association" "projetofinal_rtPub_Assoc1a" {
  subnet_id      = aws_subnet.projetofinal_subnetPub_1a.id
  route_table_id = aws_route_table.projetofinal_rtPub.id
}
resource "aws_route_table_association" "projetofinal_rtPub_Assoc1a" {
  subnet_id      = aws_subnet.projetofinal_subnetPub_1b.id
  route_table_id = aws_route_table.projetofinal_rtPub.id
}
resource "aws_route_table_association" "projetofinal_rtPub_Assoc1a" {
  subnet_id      = aws_subnet.projetofinal_subnetPub_1c.id
  route_table_id = aws_route_table.projetofinal_rtPub.id
}

resource "aws_eip" "nat_gateway1a" {
  vpc = true
}
resource "aws_eip" "nat_gateway1b" {
  vpc = true
}
resource "aws_eip" "nat_gateway1c" {
  vpc = true
}

resource "aws_nat_gateway" "projetofinal_NATGW1a" {
  allocation_id = aws_eip.nat_gateway1a.id
  subnet_id     = aws_subnet.projetofinal_subnetPub_1a.id
  tags = {
    Name = "projetofinal_NATGW1a"
  }
}
resource "aws_nat_gateway" "projetofinal_NATGW1b" {
  allocation_id = aws_eip.nat_gateway1b.id
  subnet_id     = aws_subnet.projetofinal_subnetPub_1b.id
  tags = {
    Name = "projetofinal_NATGW1b"
  }
}
resource "aws_nat_gateway" "projetofinal_NATGW1c" {
  allocation_id = aws_eip.nat_gateway1c.id
  subnet_id     = aws_subnet.projetofinal_subnetPub_1c.id
  tags = {
    Name = "projetofinal_NATGW1c"
  }
}

variable "vpc_id" {
  type        = string
}

output "subnets" {
  value = [
    "SubnetPub1a: ${aws_subnet.projetofinal_subnetPub_1a.id}",
    "SubnetPub1b: ${aws_subnet.projetofinal_subnetPub_1b.id}",
    "SubnetPub1c: ${aws_subnet.projetofinal_subnetPub_1c.id}",
    "SubnetPriv1a: ${aws_subnet.projetofinal_subnetPriv_1a.id}",
    "SubnetPriv1b: ${aws_subnet.projetofinal_subnetPriv_1b.id}",
    "SubnetPriv1c: ${aws_subnet.projetofinal_subnetPriv_1c.id}",
  ]
}