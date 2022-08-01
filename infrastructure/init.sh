#!/bin/bash
CURDIR=$(pwd)
TERDIR="./terraform"
ANSDIR="./ansible"


function init-infra-dev() {
  echo 'Start create infra!'
  cd $TERDIR/develop; terraform init && terraform apply -auto-approve; cd $CURDIR;
  cd $ANSDIR; 
  ansible-playbook -i hosts ./kubernetes-master/users.yaml; 
  ansible-playbook -i hosts ./kubernetes-master/install-kubernetes.yaml;
  ansible-playbook -i hosts ./kubernetes-master/create-master.yaml;
  ansible-playbook -i hosts ./kubernetes-node/add-workers.yaml;
  cd $CURDIR
  cd $TERDIR/jenkins; terraform init && terraform apply -auto-approve; cd $CURDIR;
}

"$@"