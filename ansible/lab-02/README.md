# Practice 02 - Ansible Control Manager Node and Managment Node
- Create docker run ansible-master
- Create docker run ansible-slaves
- Create bridge network between Master and worker
- Make sure you have connection between master and worker ( Ping:Pong )
- Copy test.txt with content **"i am move from master to node"**
- Do it without id_rsa key

```
tee inventory.yml > /dev/null <<EOF
all:
  children:
    slaves:
      hosts:
        slave-node:
          ansible_host: ansible-slave
          ansible_user: ansible
          ansible_ssh_pass: ansible
          ansible_python_interpreter: /usr/bin/python3

EOF

```
