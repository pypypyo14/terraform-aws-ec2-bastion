data "aws_ami" "amzn2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "bastion" {
  ami           = data.aws_ami.amzn2.id
  instance_type = "t3a.nano"
  key_name      = var.key_name

  vpc_security_group_ids      = list(aws_security_group.bastion.id)
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true

  tags = {
    Name    = "${var.project}_terraform_bastion"
    project = var.project
  }

  volume_tags = {
    Name    = "${var.project}_terraform_bastion"
    project = var.project
  }

}

resource "aws_security_group" "bastion" {
  name   = "${var.project}_terraform_bastion_sg"
  vpc_id = var.vpc_id
  tags = {
    Name    = "${var.project}_terraform_bastion"
    project = var.project
  }
}

resource "aws_security_group_rule" "allow_ssh_inbound" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = var.cidr_blocks

  security_group_id = aws_security_group.bastion.id
}

resource "aws_security_group_rule" "allow_all_outbound" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = var.cidr_blocks

  security_group_id = aws_security_group.bastion.id
}
