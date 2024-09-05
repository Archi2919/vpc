resource "aws_instance" "public_ec2" {
  ami                         = "ami-07355fe79b493752d"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.public-sg.id]
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.publica.id
  tags = {
    Name = "public-ec2"
  }
}

resource "aws_instance" "private_ec2" {
  ami                    = "ami-07355fe79b493752d"
  subnet_id              = aws_subnet.publicb.id
  vpc_security_group_ids = [aws_security_group.private-sg.id]
  key_name               = aws_key_pair.deployer
  instance_type          = "t2.micro"
  tags = {
    Name = "private-ec2"
  }
}
