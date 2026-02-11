# Ansible installation 
- based on Docker
- Dedicated Servers
  
- Clean up your docker work space
```
docker ps
docker ps -a
docker rm -f $(docker ps -a -q)
docker images
docker rmi -f $(docker images -q)
```
