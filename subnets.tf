resource "aws_subnet" "public" {
  count                   = 3
  vpc_id                  = aws_vpc.rda_vpc.id
  cidr_block              = cidrsubnet(aws_vpc.rda_vpc.cidr_block, 4, count.index)
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-1a"
  tags = {
    Name = "${var.name}-public-${count.index + 0}"
  }
}

resource "aws_subnet" "private" {
  count             = 6
  vpc_id            = aws_vpc.rda_vpc.id
  availability_zone = "eu-west-1b"
  cidr_block        = cidrsubnet(aws_vpc.rda_vpc.cidr_block, 4, count.index)
  tags = {
    Name = "${var.name}-private-${count.index + 0} "
  }
}
