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
  ansible-playbook -i hosts ./kubernetes-master/generate-key.yaml;
  cd $CURDIR
  cd $TERDIR/jenkins; terraform init && terraform apply -auto-approve; cd $CURDIR;
  cd $ANSDIR;
  ansible-playbook -i hosts ./jenkins-role/insall-docker.yaml;
  ansible-playbook -i hosts ./jenkins-role/generate-key.yaml;
  ansible-playbook -i hosts ./jenkins-role/run-jenkins.yaml;
  cd $CURDIR
}

function destroy-infra-dev() {
  cd $TERDIR/develop; terraform destroy -auto-approve; cd $CURDIR;
  cd $TERDIR/jenkins; terraform destroy -auto-approve; cd $CURDIR;
}

function gh_add_key() {
    echo 'Add key to github'
    KEY='{"title":"Kuber","key":"'$(cat /tmp/key_ed25519_kuber)'","read_only":true}'
    TOKEN=$(cat /tmp/token)
    curl \
      -X POST \
      -H "Accept: application/vnd.github+json" \
      -H "Authorization: token $TOKEN" \
      https://api.github.com/repos/sabotageivet123/artur-final-task/keys \
      -d "$KEY"
    echo 'Add key Jenkins to github'
    KEY='{"title":"Jenkins","key":"'$(cat /tmp/key_ed25519_jenkins)'","read_only":true}'
    curl \
      -X POST \
      -H "Accept: application/vnd.github+json" \
      -H "Authorization: token $TOKEN" \
      https://api.github.com/repos/sabotageivet123/artur-final-task/keys \
      -d "$KEY"
}

"$@"