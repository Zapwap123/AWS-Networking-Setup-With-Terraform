resource "aws_instance" "this" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.sg_ids
  associate_public_ip_address = var.public_ip
  key_name                    = var.key_name

  tags = merge(
    var.tags,
    {
      Name = "${var.env}-${var.type}-ec2"
      Env  = var.env
      Role = var.type
    }
  )
}
