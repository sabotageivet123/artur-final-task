# artur-final-task
Final task for ITEA DevOps Course

Prerequisites:
1) Optional should use Terraform Cloud with workspaces: develop, jenkins. You should add secrets for AWS: AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY.
2) Optional Generate access token for github and put to the /tmp/token. It need for adding generated ssh keys to the github for access from kubernetes and jenkins.
3) Highly recomended create ssh key on AWS or import your own to AWS .
4) IMPORTANT!!! MUST to manually create basic ASG in AWS with name "my-fleet" in case if this didn't do, jenkins wouldn't start.
5) MUST add .env file to ./infrastructure/ with secretes parameters:

ADMIN_PW=password for jenkins admin

AWS_ACCESS_KEY_ID=AWS key ID

AWS_SECRET_ACCESS_KEY=AWS secret key

DOCKER_LOGIN=docker hub user

DOCKER_PASS=docker hub password

REPO_KEY=this ssh key need for access to repo and for access to kube node from jenkins

example:

"-----BEGIN OPENSSH PRIVATE KEY-----....-----END OPENSSH PRIVATE KEY-----"

EC2_KEY=this key need for access to EC2 fleet in AWS for jenkins build nodes

example:


"-----BEGIN OPENSSH PRIVATE KEY-----....-----END OPENSSH PRIVATE KEY-----"

How to use:

1) In ./infrastructure/ directory run bash script "./init.sh init-infra-dev"

This will create VPC, EC2, SG - for Kubernetes cluster, and EC2 for Jenkins.
After creating infrastructure, script generate ssh keys on master node of kubernetes and on jenkins master node and add keys to GitHub repository.
Next step use Ansible for doing some automatisation for creating kubernetes cluster, and install jenkins with plugins using a Jenkins as a Code paradigm. 
Initial multibranch job check GitHub repository every 1 minutes for a Jenkinsfile with some instructions.
Basic logic it: download source codes, build docker image, save artifact to docker hub, update deployment on kubernetes node for use that builded image.


![plot](./schema.png)
