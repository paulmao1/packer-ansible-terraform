# Packer + Ansible + Terraform 

This repository uses packer to build an image and configures it with Ansible which host static website, then uses Terraform to spin up two instances on Azure with the image created by packer


It will use the following software:

* Nginx For web server
* Packer For building the image
* Ansible For configuring the image
* Terraform For provisioning the infrastructure on Azure


Supported platform:
* Ubuntu16.0.4
* Ubuntu18.0.4
* Azure Cloud


## Usage for Linux

1. Clone the repository and cd into it

```
git clone https://github.com/paulmao1/packer-ansible-terraform.git
cd packer-ansible-terraform
```

2. Add environment variable for Azure account and export them:
-  subscription_id=<your subscription_id>
-  client_id=<your client_id >
-  client_secret=<your client_secret>
-  tenant_id=<your tenant_id>

3. Create ResourceGroup named "myResourceGroup" to hold image  for packer  


4. Run the scripts:
-  Check yml file syntax:  make lint
-  Create image: make image
-  Create instance:  make instance

## Usage for Jenkins
1. Run Jenkins as docker like the following
-  docker run  --rm  -u root -p 80:8080 -v jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock   -v "$HOME":/home  jenkinsci/blueocean 

2. Access Jenkins like "http://<your IP>"

3. Set Azure credential on Global using "Secret Text" kind

4. Create new item and choose "Pipeline script from SCM"

5. Input "https://github.com/paulmao1/packer-ansible-terraform.git" as Repository URL

6. Finish the deployment via "Build Now"

