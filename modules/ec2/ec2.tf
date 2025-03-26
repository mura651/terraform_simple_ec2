resource "aws_security_group" "this" {
  name   = "${var.name_prefix}-web-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name_prefix}-web-sg"
  }
}

resource "aws_instance" "this" {
    ami = "ami-0599b6e53ca798bb2"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.this.id]
    associate_public_ip_address = true
    subnet_id = var.subnet_id
    user_data = file("${path.module}/init.sh")
    tags = {
        Name = "${var.name_prefix}-web-ec2"
    } 
}