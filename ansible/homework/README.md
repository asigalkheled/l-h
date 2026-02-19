# Homework
1. Create Ansible based on docker and docker network ( Master node 1 , node 2 )
2. Create test file from master and copy via copy command into both nodes
3. Bonus -  Do step 1 & 2  via Docker compose

# Playbook    
4. Create playbook playbook_nginx.yml which install and execute automatically on top of worker
5. Create playbook playbook_sh.yml which gather all Alpine OS into sys_info_alpine.txt
 - Check Alpine Version
 - Kernel Information
 - CPU Information
 - Memory Information
 - Disk Information
 - Network Information

    
cat /etc/alpine-release
uname -a
cat /proc/cpuinfo
lscpu             # add to the bash if needed       apk add util-linux
free -m           # add to the bash if needed       apk add procps
cat /proc/meminfo
df -h
ip a               # add to the bash if needed      apk add iproute2
ifconfig           # add to the bash if needed      apk add net-tools



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
