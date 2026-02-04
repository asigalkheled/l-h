# Hands-On - Docker Argument port
- Based on Dockerfile
  - Create a html page file with title **Docker Argument port**
  - Build image
  - Set tag and push it into your docker hub
  - Docker run with port 5023
  - Make sure its runing via the Browser
  - Remove the image and and container id **docker run time**
  - Pull the image from your docker hub
  - Docker run with two diffrent port
    - .i.e
```
http://localhost:5023
http://localhost:5024
```

  - Run the docker top, stats, inspect commands
  - Copy the index.html file from docker container to your host, one dir back

## Solution: Hands-On - Docker Argument port
```
echo "<h1>Docker Argument port</h1>" > index.html
```
- Clean up if needed all the Docker containers and docker images

```
docker rm -f $(docker ps -a -q)
docker rmi -f $(docker images -q)
```
```
docker build -t html-server .
docker run -d   --name web5023   -e PORT=5023   -p 5023:5023   html-server
docker ps
docker run -d   --name web5024   -e PORT=5024   -p 5024:5024   html-server
docker ps
# Hands-On– Lab-03-Basic Commands based on Jenkins
```
- Jenkins docker pull and docker run on one command​
- Open the Jenkins via the browser​
- Create free style Job of "Hello world"​
- Go to the logs of Jenkins
- Run the docker top, stats, inspect commands 
