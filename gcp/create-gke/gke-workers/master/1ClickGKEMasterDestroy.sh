#!/bin/bash

##terraform log
nowtime=`date +"%m_%d_%Y_%s"`
(mkdir -p ./tflogs)
export TF_LOG="INFO"
export TF_LOG_PATH="./tflogs/terraform-destroy-$nowtime.log"

set -e

echo "1ClickMasterDestroy.sh: Copying variable files"
cp -f ../../variables.tf .
cp -f ../../terraform.tfvars .

terraform init

echo "1ClickGKEMasterDestroy.sh: Terraform Destroy"
terraform destroy -auto-approve
