# Terraform + Ansible EC2 Automation

## Overview

This project demonstrates Infrastructure as Code (IaC) and configuration management by combining Terraform and Ansible.

- **Terraform:** Provisions AWS EC2 instances.
- **Ansible:** Manages and configures EC2 instances.
- **Dynamic Inventory:** Automatically generates Ansible inventory using Terraform outputs.

## Architecture

Developer
   |
   v
Terraform
   |
   v
AWS EC2 Instances
   |
   v
Dynamic Inventory Generation
   |
   v
Ansible Inventory
   |
   v
Ansible Playbooks
   |
   v
EC2 Configuration

## Technologies Used

- AWS EC2
- Terraform
- Ansible
- Linux (Ubuntu)
- SSH
- PowerShell
- Github
- html

## Project Structure

terraform-ansible-ec2-automation/
|
├── inventories/
│   └── dev/
|___ playbooks/
|     |__files/index.html
|     |__install-apache.yml
|
├── terraform/
│   ├── ec2.tf
│   ├── providers.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── generate-inventory.tf
│   └── templates/
│       └── inventory.tpl
|
├── .gitignore
└── README.md

## Workflow

1. Configure AWS credentials.
2. Initialize Terraform.
3. Provision EC2 instances using Terraform.
4. Generate Ansible inventory dynamically.
5. Connect to EC2 instances through SSH.
6. Execute Ansible playbooks to configure the servers.

## Prerequisites

- AWS account
- AWS CLI
- Terraform
- Ansible
- SSH key pair

## Terraform Commands

Initialize Terraform:

```bash
terraform init
```

Validate configuration:

```bash
terraform validate
```

Preview infrastructure changes:

```bash
terraform plan
```

Create infrastructure:

```bash
terraform apply
```

## Ansible Commands

Verify connectivity:

```bash
ansible all -i inventories/dev/hosts.ini -m ping
```

Run a playbook:

```bash
ansible-playbook -i inventories/dev/hosts.ini install-apache.yml
```

## Security

- Never commit private SSH keys.
- Never commit AWS credentials.
- Keep Terraform state files out of public repositories.
- Use IAM roles and least-privilege permissions.

## Author

Created as a hands-on DevOps and Infrastructure as Code learning project.
