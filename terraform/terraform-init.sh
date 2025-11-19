#!/bin/bash
#./terraform-init.sh dev plan
ENVIRONMENT=$1
ACTION=$2
terraform init -reconfigure 
terraform workspace new $ENVIRONMENT || true
terraform workspace select $ENVIRONMENT
terraform ${ACTION} -var-file "../../environments/${ENVIRONMENT}/dev.tfvars" # -auto-approve
