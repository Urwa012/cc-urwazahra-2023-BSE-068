# Assignment 2 - Multi-Tier Web Infrastructure

## Project Overview
- This project sets up a multi-tier web infrastructure on AWS using Terraform.  
- It includes an Nginx server as a load balancer and three Apache web servers for high availability.  
- The setup ensures proper load distribution, failover, and security between the components.

---

## Architecture Diagram

┌───────────────────────────────────────────┐
│               Internet                    │
└─────────────────┬─────────────────────────┘
                    │
                    │ HTTPS (443)
                    │ HTTP (80)
                    ▼
            ┌─────────────────────┐
            │ Nginx Server        │
            │ (Load Balancer)     │
            │ - SSL/TLS           │
            │ - Caching           │
            │ - Reverse Proxy     │
            └─────────┬───────────┘
                      │ 
          ┌───────────┼───────────┐
          │           │           │
          ▼           ▼           ▼
        ┌─────┐     ┌─────┐     ┌─────┐
        │Web-1│     │Web-2│     │Web-3│
        │     │     │     |     Backup 
        └─────┘     └─────┘     └─────┘

## Components Description

- **Nginx Server (Load Balancer)**  
  - Handles HTTPS/HTTP traffic, SSL termination, caching, and reverse proxy.
  - Instance ID: `i-0b3dbf2426dfd2644`  
  - Public IP: `13.233.245.69`  
  - Security Group: `sg-03e219b151948c27e`  


- **Web Servers (Backend)**
  - Hosts web applications, serves traffic via Nginx load balancer.
  - **Web-1**: `i-046b462c835b9dcc4`, Public IP: `13.232.18.204`, Private IP: `10.0.10.50`
  - **Web-2**: `i-09a9941731c63f0c2`, Public IP: `15.206.69.134`, Private IP: `10.0.10.236`
  - **Web-3 (Backup)**: `i-0a55b0a71beeacde6`, Public IP: `65.2.186.176`, Private IP: `10.0.10.13`
  - Security Group: `sg-02d76bcec2536b341`  

  
  **Terraform**  
  - Automates deployment of all infrastructure resources (VPC, subnet, security groups, EC2 instances).  

  ---


## Prerequisites

 **Tools Required**: Terraform, AWS CLI, SSH client

- **AWS Setup**
  - Configure AWS credentials (`aws configure`)
  - Ensure correct IAM permissions to create EC2, VPC, Security Groups, Subnets

- **SSH Key**
  - Private key for EC2 access
  - Public key uploaded to AWS EC2 instances


## Deployment Instructions
This section explains how to deploy the multi-tier web infrastructure using Terraform.

1. **Clone the Repository**

git clone <your-repository-url>
cd Assignment2

dit terraform.tfvars


2. **Update variables as per your AWS setup:**

region = "your-aws-region"
key_name = "your-key-name"
instance_type = "t2.micro"
vpc_id = "vpc-08030b2a98bed25c9"
subnet_id = "subnet-0d2465c352aae3997"
nginx_sg_name = "nginx-sg"
backend_sg_name = "backend-sg"


3:**Initialize Terraform**

```
terraform init
terraform apply
```

Type **"yes"** when prompted

```
terraform output
```

## Configuration Guide

### Updating Backend IPs in Nginx

###SSH into Nginx server:

ssh ec2-user@13.233.245.69

**###Edit Nginx config**:

sudo vim /etc/nginx/nginx.conf


**###Update upstream block with backend private IPs:**

```
upstream backend {
    server 10.0.10.50;
    server 10.0.10.236;
    server 10.0.10.13 backup;
}
```

###Restart Nginx:

```
sudo systemctl restart nginx
```

## Testing Procedures

Access the load balancer in browser: https://13.233.245.69

Check load balancing by refreshing multiple times

Verify backup server works by stopping one primary backend


## Architecture Details

Network Topology: 1 VPC, 1 subnet, public Nginx, private backend servers

Security Groups: Nginx SG allows 80/443 from internet; Backend SG allows 80 from Nginx SG only

Load Balancing Strategy: Round-robin by Nginx with a backup server


## Troubleshooting

### Common Issues and Solutions

| Issue                               | Possible Cause / Solution                                  |
|------------------------------------|------------------------------------------------------------|
| Cannot SSH into Nginx or backend   | - Check the security group allows SSH (port 22)           |
|                                    | - Ensure you are using the correct key pair              |
|                                    | - Verify the public IP of the instance                   |
| Nginx not routing to backend        | - Check backend IPs in `/etc/nginx/nginx.conf`           |
|                                    | - Restart Nginx: `sudo systemctl restart nginx`          |
| Terraform apply fails               | - Check AWS credentials in `terraform.tfvars`            |
|                                    | - Ensure the region and VPC/subnet IDs are correct       |
| Website not accessible via browser | - Ensure Nginx security group allows HTTP/HTTPS          |
|                                    | - Verify backend servers are running                     |

### Log Locations

- Nginx access log: `/var/log/nginx/access.log`  
- Nginx error log: `/var/log/nginx/error.log`  
- System journal (for Nginx): `sudo journalctl -u nginx.service`

### Debug Commands

- Check Nginx service status:
```
sudo systemctl status nginx
```
