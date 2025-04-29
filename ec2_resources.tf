resource "aws_instance" "web1" {
  ami                         = "ami-084568db4383264d4"
  instance_type               = "t2.micro"
  key_name                    = "twotier-key-pair"
  availability_zone           = "us-east-1a"
  subnet_id                   = aws_subnet.public_1.id
  vpc_security_group_ids      = [aws_security_group.public_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install nginx -y
              sudo systemctl enable nginx
              sudo systemctl start nginx
              EOF

  tags = {
    Name = "web1_instance"
    Role = "Web Server"
  }
}

resource "aws_instance" "web2" {
  ami                         = "ami-084568db4383264d4"
  instance_type               = "t2.micro"
  key_name                    = "twotier-key-pair"
  availability_zone           = "us-east-1b"
  subnet_id                   = aws_subnet.public_2.id
  vpc_security_group_ids      = [aws_security_group.public_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install nginx -y
              sudo systemctl enable nginx
              sudo systemctl start nginx
              EOF

  tags = {
    Name = "web2_instance"
    Role = "Web Server"
  }
}
