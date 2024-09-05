resource "aws_vpc" "rda_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "rda-vpc"
  }
}
