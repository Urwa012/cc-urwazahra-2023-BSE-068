provider "aws" {
  region = "ap-south-1"
}

# Networking module
module "networking" {
  source            = "./modules/networking"
  vpc_cidr_block    = var.vpc_cidr_block
  subnet_cidr_block = var.subnet_cidr_block
  availability_zone = var.availability_zone
  env_prefix        = var.env_prefix
}

# Security module
module "security" {
  source     = "./modules/security"
  vpc_id     = module.networking.vpc_id
  env_prefix = var.env_prefix
  my_ip      = var.my_ip
}

# Nginx Server
module "nginx_server" {
  source            = "./modules/webserver"
  env_prefix        = var.env_prefix
  instance_name     = "nginx-proxy"
  instance_type     = var.instance_type
  availability_zone = var.availability_zone
  vpc_id            = module.networking.vpc_id
  subnet_id         = module.networking.subnet_id
  security_group_id = module.security.nginx_sg_id
  public_key        = file(var.public_key)
  private_key       = file(var.private_key)
  script_path       = "./scripts/nginx-setup.sh"
  instance_suffix   = "nginx"
ami_id = "ami-00ca570c1b6d79f36"
  common_tags       = local.common_tags
  server_name       = "nginx-proxy"
}

module "backend_servers" {
  for_each = { for s in local.backend_servers : s.name => s }

  source            = "./modules/webserver"
  env_prefix        = var.env_prefix        # <<< ADD THIS
  instance_name     = each.value.name
  instance_suffix   = each.value.suffix
  instance_type     = var.instance_type
  availability_zone = var.availability_zone
  vpc_id            = module.networking.vpc_id
  subnet_id         = module.networking.subnet_id
  security_group_id = module.security.backend_sg_id
  public_key        = file(var.public_key)
  private_key       = file(var.private_key)
  script_path       = each.value.script_path
  server_name       = each.value.name
  ami_id = "ami-00ca570c1b6d79f36"
  common_tags       = local.common_tags
}

# Outputs
output "nginx_sg_id" {
  value = module.security.nginx_sg_id
}

output "backend_sg_id" {
  value = module.security.backend_sg_id
}

#output "nginx_public_ip" {
 # value = module.nginx_server.public_ip
#}

output "backend_public_ips" {
  value = { 
    for key, server in module.backend_servers : key => server.public_ip
  }
}
