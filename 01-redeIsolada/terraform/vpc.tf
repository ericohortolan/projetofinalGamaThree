resource "aws_subnet" "projetofinal_subnetPub_1a" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "10.99.50.0/24"
  availability_zone = "sa-east-1a"

  tags = {
    Name = "projetofinal_subnetPub_1a"
  }
}
resource "aws_subnet" "projetofinal_subnetPriv_1a" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "10.99.51.0/24"
  availability_zone = "sa-east-1a"

  tags = {
    Name = "projetofinal_subnetPriv_1a"
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
    Name = "projetofinal-PrivateRT"
  }
}

resource "aws_route_table" "projetofinal_rtPriv" {
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
        nat_gateway_id             = aws_nat_gateway.projetofinal_NATGW.id
        network_interface_id       = ""
        transit_gateway_id         = ""
        vpc_endpoint_id            = ""
        vpc_peering_connection_id  = ""
      }
  ]
  tags = {
    Name = "projetofinal-PrivateRT"
  }
}

resource "aws_route_table_association" "projetofinal_rtPriv_Assoc" {
  subnet_id      = aws_subnet.projetofinal_subnetPriv_1a.id
  route_table_id = aws_route_table.projetofinal_rtPriv.id
}

resource "aws_route_table_association" "projetofinal_rtPub_Assoc" {
  subnet_id      = aws_subnet.projetofinal_subnetPub_1a.id
  route_table_id = aws_route_table.projetofinal_rtPub.id
}

resource "aws_eip" "nat_gateway" {
  vpc = true
}

resource "aws_nat_gateway" "projetofinal_NATGW" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = aws_subnet.projetofinal_subnetPub_1a.id
  tags = {
    Name = "projetofinal_NATGW"
  }
}
