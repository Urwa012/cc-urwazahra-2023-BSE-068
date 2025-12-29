resource "aws_key_pair" "this" {
  key_name   = "${var.env_prefix}-${var.instance_name}-key"
  public_key = var.public_key
}

resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  availability_zone      = var.availability_zone
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = aws_key_pair.this.key_name

  user_data = file(var.script_path)

  tags = merge(
    {
      Name = "${var.env_prefix}-${var.instance_name}-${var.instance_suffix}"
    },
    var.common_tags
  )
}
