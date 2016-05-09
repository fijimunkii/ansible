# Ansible Scripts

## To run the playbook 
`ansible-playbook server.yml`

## To edit encrypted configs
`ansible-vault edit group_vars/domain.com.yml`

## To ping hosts with a local file

`ansible all -m ping`

## To ping all ec2 instances

Copy helper script and ini `mkdir library && cd library && wget https://raw.github.com/ansible/ansible/devel/contrib/inventory/ec2.py && wget https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.ini && cd -`

`pip install boto`

`export AWS_ACCESS_KEY_ID='AK123'`

`export AWS_SECRET_ACCESS_KEY='SC123'`

`ansible all -i library/ec2.py -m ping`

## Speed up encryption

`pip install cryptography`

## To get ansible variables in key value form for all hosts

`ansible all -m setup`
