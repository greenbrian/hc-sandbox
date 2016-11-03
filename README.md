# hc-sandbox
Hashicorp tool sandbox  


All operations done through Terraform Enterprise UI  

## Packer code details  

packer/packer.json contains all image build instructions  
packer/scripts contains build scripts  
packer/config contains config files  

## Packer Terraform Enterprise UI details  

Login to web interface  
Navigate to Packer on left pane  
Click New Build Configuration  

## Terraform code details

terraform/main.tf is the main Terraform executable
terraform/consul-vault contains Consul/Vault specific Terraform code
terraform/haproxy contains HAProxy specific Terraform code
terraform/nginx contains Nginx specific Terraform code  
