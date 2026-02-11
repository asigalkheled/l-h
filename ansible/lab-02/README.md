# Practice 02 - Ansible Control Manager Node and Managment Node
- Create docker run ansible-master
- Create docker run ansible-slaves
- Create bridge network between Master and worker
- Make sure you have connection between master and worker ( Ping:Pong )
- Copy test.txt with content **"i am move from master to node"**
- Do it without id_rsa key


```
docker ps
docker ps -a
docker rm -f $(docker ps -a -q)
docker images
docker rmi -f $(docker images -q)
docker network ls
docker network rm (C_ID)
docker network prune
```

## Start slave container
```
docker network ls
docker network create ansible-net
```

- Docker run without browser
  - give lab that do all the steps with browser
- Docker run with browser via expose port
```
docker run -d \
  --name ansible-slave \
  --network ansible-net \
  alpine:3.19 sleep infinity
```


```
docker exec -it ansible-slave sh
apk update
apk add openssh python3 sudo
ssh-keygen -A
adduser -D ansible
echo "ansible:ansible" | chpasswd
echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
/usr/sbin/sshd
exit
```

## Start master container

```
docker run -it \
  --name ansible-master \
  --network ansible-net \
  alpine:3.19 sh
```

```
apk update
apk add ansible openssh-client sshpass python3
```
- Create inventory

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
- Test SSH manually

```
ssh ansible@ansible-slave
exit
ansible all -i inventory.yml -m ping
```

- Ansible Copy module

```
echo "hello test" > hello.txt
ansible all -i inventory.yml -m copy -a "src=hello.txt dest=/tmp/hello.txt"
``` 
