# Homework
1. Create Ansible based on docker and docker network ( Master node 1 , node 2 )
2. Create test file from master and copy via copy command into both nodes

 ## Bonus
 1. Do step 1 & 2  via Docker compose

```
tee inventory.yml <<EOF
all:
  children:
    master:
      hosts:
        master-node:
          ansible_host: 172.17.0.2
          ansible_user: ansible
          ansible_ssh_private_key_file: /id_rsa

    slaves:
      hosts:
        slave-node:
          ansible_host: 172.17.0.2
          ansible_user: ansible
          ansible_ssh_private_key_file: /id_rsa

    cluster:
      children:
        master:
        slaves:
EOF


```
