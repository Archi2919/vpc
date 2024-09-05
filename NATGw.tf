resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.rda-eip.id
  subnet_id     = aws_subnet.publica.id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}
