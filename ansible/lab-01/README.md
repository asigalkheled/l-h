# Ansible installation 
- based on Docker
- Dedicated Servers

## Ansible installation based on Docker with rsa key

- Cleanup if needed
```
docker ps
docker ps -a
docker rm -f $(docker ps -a -q)
docker images
docker rmi -f $(docker images -q)
```
### Ansible Agent Linux
- **ssh-keygen -R** It removes a saved host key from your SSH known_hosts file
- install ansible-slave
- Go into docker run and install python3
- Get the private ip
- **ssh-keygen -A** Commonly used when setting up servers, containers, or fresh VMs
- Set PubkeAuth = yes and PasswordAuth = yes in sshd_config file
- Add ansible user
- Start the sshd and check the open port

```
ssh-keygen -R "[localhost]:2222"
cat /c/Users/<username>/.ssh/known_hosts
docker run -d --name ansible-slave -p 2222:22 alpine:latest sleep infinity
docker ps
docker inspect <C_ID>
docker exec -it ansible-slave sh
apk add openssh vim python3
python --version
ifconfig

ssh-keygen -A
echo PubkeyAuthentication yes >> /etc/ssh/sshd_config
echo PasswordAuthentication yes >> /etc/ssh/sshd_config
adduser ansible
/usr/sbin/sshd
netstat -tlnp | grep :22
exit
```

#### Configure Ansible User

- Login with ansible user
- **ssh-keygen -t** Create client identity
- Rename to authorized_keys 

```
docker exec -it ansible-slave su - ansible
whoami
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
mv .ssh/id_rsa.pub .ssh/authorized_keys
cat .ssh/authorized_keys
exit
```
#### Test SSH Connection

- Copy the key from docker run to git bash cli
- Test connection port

```
docker cp ansible-slave:/home/ansible/.ssh/id_rsa .
ls
ssh -i id_rsa -p 2222 ansible@localhost
exit
```
