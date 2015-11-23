# Ansible Scripts

## To run the playbook 
`ansible-playbook server.yml -i hosts -u ubuntu --ask-vault-pass`

## To edit encrypted configs
`ansible-vault edit group_vars/***REMOVED***.com.yml`

## To ping hosts with a local file

`ansible all -i hosts -u ubuntu -m ping`

## To ping all ec2 instances

Copy helper script and ini `mkdir library && cd library && wget https://raw.github.com/ansible/ansible/devel/contrib/inventory/ec2.py && wget https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.ini && cd -`

`pip install boto`

`export AWS_ACCESS_KEY_ID='AK123'`

`export AWS_SECRET_ACCESS_KEY='SC123'`

`ansible all -i library/ec2.py -u ubuntu -m ping`

## Speed up encryption

`pip install cryptography`
