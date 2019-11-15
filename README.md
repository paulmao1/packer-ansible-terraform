# Packer + Ansible + Terraform 

This repository uses packer to build an image and configures it with Ansible which host static website, then uses Terraform to spin up an instance on Azure with the image created by packer


It will use the following software:

* nginx for web server
* Packer For building the image
* Ansible For configuring the image
* Terraform For provisioning the infrastructure on Azure


Supported platform:
* Ubuntu16.0.4
* Ubuntu18.0.4
* Azure Cloud


## Usage

1. Clone the repository and cd into it

```
git clone https://github.com/paulmao1/packer-ansible-terraform.git
cd packer-ansible-terraform
```

2. Replace your account information in the following files:
-  Packer:  tempalate.json
-  Terraform: terraform.tfvars

3. Create ResourceGroup named "myResourceGroup" to hold image  for packer  

4. Run the scripts:
-  Check yml file syntax:  make lint
-  Create image: make image
-  Create instance:  make instance
