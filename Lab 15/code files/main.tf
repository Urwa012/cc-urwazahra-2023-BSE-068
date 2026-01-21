provider "aws" {
  region = "me-central-1"
}

# 1. Call the Networking Module (Matches Lab 11/12 logic)
module "myapp-subnet" {
  source            = "./modules/subnet"
  vpc_cidr_block    = var.vpc_cidr_block
  subnet_cidr_block = var.subnet_cidr_block
  avail_zone        = var.avail_zone
  env_prefix        = var.env_prefix
}

# 2. Define Security Group
resource "aws_security_group" "myapp-sg" {
  name   = "myapp-sg"
  vpc_id = module.myapp-subnet.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [local.my_ip]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env_prefix}-sg"
  }
}

# 3. Create Key Pair (Matches Lab 9 logic)
resource "aws_key_pair" "ssh-key" {
  key_name   = "server-key"
  public_key = file(var.my_public_key_location)
}

# Get latest Amazon Linux 2023 AMI (Matches Lab 10 logic)
data "aws_ami" "latest-amazon-linux-image" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

# 4. Frontend Instance
resource "aws_instance" "frontend" {
  ami                         = data.aws_ami.latest-amazon-linux-image.id
  instance_type               = var.instance_type
  subnet_id                   = module.myapp-subnet.subnet_id
  vpc_security_group_ids      = [aws_security_group.myapp-sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true
  key_name                    = aws_key_pair.ssh-key.key_name

  tags = {
    Name = "${var.env_prefix}-frontend"
  }
}

# 5. Backend Instances (Count = 3 for Lab 15 Requirement)
resource "aws_instance" "backend" {
  count                       = 3
  ami                         = data.aws_ami.latest-amazon-linux-image.id
  instance_type               = var.instance_type
  subnet_id                   = module.myapp-subnet.subnet_id
  vpc_security_group_ids      = [aws_security_group.myapp-sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true
  key_name                    = aws_key_pair.ssh-key.key_name

  tags = {
    Name = "${var.env_prefix}-backend-${count.index + 1}"
  }
}

# 6. Generate Ansible Inventory File
resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/ansible/inventory.tpl", {
    frontend_ip = aws_instance.frontend.public_ip
    backend_ips = aws_instance.backend[*].public_ip
  })
  filename = "${path.module}/ansible/inventory/hosts"
}

# 7. Trigger Ansible Playbook (Fixed for your specific file names)
resource "null_resource" "run_ansible" {
  triggers = {
    frontend_ip = aws_instance.frontend.public_ip
    backend_ips = join(",", aws_instance.backend[*].public_ip)
  }

  depends_on = [
    aws_instance.frontend,
    aws_instance.backend,
    local_file.ansible_inventory
  ]

  provisioner "local-exec" {
    command = <<EOT
      echo "Waiting 60 seconds for SSH to be ready..."
      sleep 60
      chmod 400 MyLabKey.pem
      cd ansible
      ANSIBLE_ROLES_PATH=./roles ANSIBLE_HOST_KEY_CHECKING=False \
      ansible-playbook -i inventory/hosts playbooks/site.yaml \
      --private-key ../MyLabKey.pem -u ec2-user
    EOT
  }
}