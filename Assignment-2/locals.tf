# Fetch your public IP dynamically
data "http" "my_ip" {
  url = "https://icanhazip.com"
}

# Local variables
locals {
  # Dynamic IP detection
  my_ip = "${chomp(data.http.my_ip.response_body)}/32"

  # Common tags for all resources
  common_tags = {
    Environment = var.env_prefix
    Project     = "Lab12-Assignment"
    ManagedBy   = "Terraform"
  }

  # Backend server configuration list
  backend_servers = [
    {
      name        = "web-1"
      suffix      = "1"
      script_path = "./scripts/apache-setup.sh"
    },
    {
      name        = "web-2"
      suffix      = "2"
      script_path = "./scripts/apache-setup.sh"
    },
    {
      name        = "web-3"
      suffix      = "3"
      script_path = "./scripts/apache-setup.sh"
    }
  ]
}
