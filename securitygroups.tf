resource "aws_security_group" "public-sg" {
  name        = "${var.name}-public-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.rda_vpc.id

  ingress {
    description = "TLS into instance"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH into instance"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}_public_sg"
  }
}

resource "aws_security_group" "private-sg" {
  name        = "${var.name}-private-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.rda_vpc.id

  ingress {
    description     = "TLS into instance"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [aws_security_group.public-sg.id]
  }

  ingress {
    description = "SSH into instance"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}_private_sg"
  }
}
