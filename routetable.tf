resource "aws_route_table" "rda_rt" {
  vpc_id = aws_vpc.rda_vpc.id
  tags = {
    Name = "${var.name}-public-rt"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.rda_vpc.id
  tags = {
    Name = "${var.name}-private-rt"
  }

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.publica.id
  route_table_id = aws_route_table.rda_rt.id
}


resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.publicb.id
  route_table_id = aws_route_table.private-rt.id
}
