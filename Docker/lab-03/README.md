# Hands-On– Lab-03-Basic Commands based on Jenkins

- Jenkins docker pull and docker run on one command​
- Open the Jenkins via the browser​
- Create free style Job of "Hello world"​
- Go to the logs of Jenkins​
  
## Solution: Docker pull & Docker run via port


```
docker pull jenkins/jenkins
docker run -p 8080:8080 --name=jenkins-master -d jenkins/jenkins
docker ps
docker ps -a
```
- Go to the login page via the browser http://localhost:8080/
- Generate and past the password into the login page

```
docker logs --follow jenkins-master           # past the password in order to get login page and admin@admin as default
```



### Build a new Image via Dockerfile base on nodejs and jenkins images

- Create a app.js Application based of Node which running ​
- res.end('Hello, World!\n');​
- Wrap it with dockerfile​
- Build an image​
- Run the image​
- Go to the app via the via the Browser​
- Test the node version via interactive mode​
- Tag, Push and verify the Image in Docker Hub

### Solution: Build a new Image via Dockerfile base on nodejs and jenkins images

- Download the Dockerfile
- Build Time run the command below in order to create new local image

```
docker build -t jenkins-with-nodejs:1.0 .
docker images
docker images | awk '{print $1}'
```

- Run time run the command below in order to run the docker on backround

```
docker run -d --name jenkins -p 8080:8080 jenkins-with-nodejs:1.0
docker ps
```

- Go the the browser and make sure the login page of Jenkins is running http://127.0.0.1:8080
- Get jenkins password via command

#### Fix Error via WSL
- Open the cli of WSL and type the command below, it is not work with cli of Git Bash

```
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

#### Create First Admin User
- Username = admin
- Password = admin
- Full name = admin
- E-mail address = admin@admin
- Go into Docker shell

```
docker run -it jenkins-with-nodejs:1.0 /bin/bash
cd /usr/local/bin/
node -v
```


## Hands-On - Docker network - Two diff bridge mynet
- Creating new network
- Launching containers in different bridges
- Launch two containers nt01 and nt02 in default bridge network
- Launch two containers nt03 and nt04 in mynet bridge network
- Go into nt01 container and ping to nt02 or nt03
- Go into nt01 container and ping to nt03 or nt04
