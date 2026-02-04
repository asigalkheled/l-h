# Linux Container (LXC) - Bonus Solution
- LXC (Linux Containers) is part of the Ubuntu ecosystem,
  But it's not installed by default, Its official support on Ubuntu 12.04+

| Category     | Description | 
|--------------|-------------|
|What LXC provides (independent)       |File system, process tree, networking stack|
|What LXC uses (implementation)	   |Namespaces, cgroups, capabilities (UFS)	| 

## LXC Provides Independence isolated environments that LXC offers for containers:
- Display the File System - Each container has its own root filesystem (separate from host)
- Display the process tree - Processes inside the container are separate and isolated from the host
- Display the Networking Stacks - Each container has its own network interfaces, routing table, IP stack
  
```
  # Display the File System
ls -l /
tree -L 2 / 2>/dev/null || ls -l /

  # Display the process tree 
ps -ef --forest
pstree -p

  # Display the Networking Stacks - made up of various layers
ip addr
netstat -rn || ip route

```


These create the illusion that each container is its own standalone Linux system.
## LXC Is Implemented Using
These are the Linux kernel features that make LXC’s independence possible

- Namespaces	Provide isolation (PID, NET, IPC, UTS, MNT, USER)
- cgroups (Control Groups)	Limit and monitor resource usage (CPU, RAM, I/O)
- Capabilities (UFS)	Drop or assign fine-grained root privileges

```
  #HOST NAMESPACES, is isolate container processes from the host
lsns

  # HOST CGROUPS
  # 402 - is PID of user dinghy in cgroups under wsl cli
ls -l /proc/402/cgroup

  # Capabilities are fine-grained privileges (e.g., CAP_NET_ADMIN, CAP_SYS_ADMIN).
grep Cap /proc/402/status
capsh --print
```





# Lab-01 Docker Monopoly game

```
docker run -it --name monopoly_8443 -p 8443:8443 gonzague/monopoly
https://localhost:8443/
docker images
docker ps -a
docker start <Container ID>
docker stop <Container ID>

```

# Hands-On – Lab Docker commands based on httpbin

```
docker run --name http_error -d -p 8990:80 kennethreitz/httpbin
http://localhost:8990/
docker stop <container id>
docker start <container id>
docker reststart <container id>
docker exec -it http_error bash
docker ps
docker ps -a
docker images
docker rm -f <container id>
docker rmi -f <container id>
docker exec -it http_error bash

# echo "fix bug 1010" > fix-bug1010.txt
docker commit aef7717dea84 http_error:fix1010
docker ps
docker images | grep -i http
docker run --name http_error -d -p 8900:80 5872ce97baad
docker ps
docker tag 5872ce97baad dinghy123/http_error:fix1010
docker images
docker push dinghy123/http_error:fix1010
```


## mysql db Basic Commands​
- Docker pull mysql​
- Docker run with port 3406​
- List of all images​
- Go inside a running mysql container​
- Go to Cli of mysql and show all database
- select * from user ​

```
docker pull mysql
docker run --name test-mysql -e MYSQL_ROOT_PASSWORD=strong_password -d mysql
docker run --name test-mysql -p 33306:3306 -e MYSQL_ROOT_PASSWORD=strong_password -d mysql

   #Run mysql tag version 5  
docker run -d --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=secret -e MYSQL_DATABASE=mySchema mysql:5
docker exec -it mysql bash
docker exec -it test-mysql bash
mysql -u root -p
strong_password
use mysql;
show tables;
select * from user
select User from user;
```
