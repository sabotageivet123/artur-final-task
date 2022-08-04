import boto3
ec2 = boto3.resource('ec2')

instances = ec2.instances.filter(
    Filters=[{'Name': 'instance-state-name', 'Values': ['running']}])
for instance in instances:
    for tag in instance.tags:
        if tag['Key'] == 'Name':
            if "master-finaltask" in tag['Value']:
                print("[master]")
                print("master ansible_host="+instance.public_ip_address+" ansible_user=ubuntu ansible_connection=ssh ansible_ssh_private_key_file=~/.ssh/final-test.pem")
            if "jenkins-finaltask" in tag['Value']:
                print("[jenkins]")
                print("jenkins ansible_host="+instance.public_ip_address+" ansible_user=ubuntu ansible_connection=ssh ansible_ssh_private_key_file=~/.ssh/final-test.pem")
instances = ec2.instances.filter(
    Filters=[{'Name': 'instance-state-name', 'Values': ['running']}, {'Name': 'tag:Name', 'Values': ['*worker*']}])
print("[worker]")
for instance in instances:
    i=0
    for tag in instance.tags:
        if tag['Key'] == 'Name':
            if "worker-finaltask" in tag['Value']:
                i+1
                print("worker-"+str(i)+" ansible_host="+instance.public_ip_address+" ansible_user=ubuntu ansible_connection=ssh ansible_ssh_private_key_file=~/.ssh/final-test.pem")