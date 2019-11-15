
lint:	
	@echo "Starting lint"
	@echo "-----------------------------------"
	find . -name "*.yml" | xargs ansible-lint
	@echo "-----------------------------------"
	@echo "Completed lint"

image:
	echo "Starting build image"
	@echo "-----------------------------------"
	cd packer &&packer build template.json &&cd ..
	@echo "-----------------------------------"
	echo "Completed packer"

instance: 
	@echo "Starting  create VM using terraform"
	@echo "-----------------------------------"
	cd terraform && terraform init && terraform plan && terraform apply
	@echo "-----------------------------------"
	@echo "Completed instance"
