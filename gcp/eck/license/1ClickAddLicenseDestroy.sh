#!/bin/bash

##terraform log
nowtime=`date +"%m_%d_%Y_%s"`
(mkdir -p ./tflogs)
export TF_LOG="INFO"
export TF_LOG_PATH="./tflogs/terraform-destroy-$nowtime.log"

set -e

terraform init -upgrade
terraform refresh

echo "1CLickAddLicenseDestroy.sh: Terraform Destroy"
terraform destroy -auto-approve