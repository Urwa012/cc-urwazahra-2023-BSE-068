

vpc_cidr_block    = "10.0.0.0/16"
subnet_cidr_block = "10.0.10.0/24"
availability_zone = "ap-south-1a"
env_prefix        = "prod"
my_ip             = "39.33.159.42/32"

instance_type     = "t3.micro"
public_key        = "C:\\Users\\TT\\.ssh\\id_ed25519.pub"
private_key       = "C:\\Users\\TT\\.ssh\\id_ed25519"

backend_servers = [
  { name = "web-1", script_path = "scripts/apache-setup.sh" },
  { name = "web-2", script_path = "scripts/apache-setup.sh" },
  { name = "web-3", script_path = "scripts/apache-setup.sh" }
]
