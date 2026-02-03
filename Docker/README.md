# Lab-01 Docker Monopoly game

```
docker run -it --name monopoly_8443 -p 8443:8443 gonzague/monopoly
https://localhost:8443/
docker images
docker ps -a
docker start <Container ID>
docker stop <Container ID>

```

# Hands-On – Lab-02 Docker commands based on httpbin

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
