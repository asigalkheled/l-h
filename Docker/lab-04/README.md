# Docker Network 
## Hands-On - Docker network - Two diff bridge mynet
- Creating new network
- Launching containers in different bridges
- Launch two containers nt01 and nt02 in default bridge network
- Launch two containers nt03 and nt04 in mynet bridge network
- Go into nt01 container and ping to nt02 or nt03
- Go into nt01 container and ping to nt03 or nt04

```
docker network create -d bridge mynet
docker network inspect mynet
```
- Launch two containers nt01 and nt02 in default bridge network
```
docker container run -idt --name nt01 alpine sh
docker container run -idt --name nt02 alpine sh
```

- Launch two containers nt03 and nt04 in **mynet** bridge network

```
docker container run -idt --name nt03 --net mynet alpine sh
docker container run -idt --name nt04 --net mynet alpine sh
```

- lets examine if they can interconnect

```
docker exec nt01 ifconfig eth0
docker exec nt02 ifconfig eth0
docker exec nt03 ifconfig eth0
docker exec nt04 ifconfig eth0
  # OutPut
nt01 = 172.17.0.4  
nt02 = 172.17.0.5  
nt03 = 172.22.0.2  
nt04 = 172.22.0.3  
```

- Go into nt01 container and ping to nt02 
- Go into nt01 container and ping to nt03 or nt04
```
docker exec -it nt01 sh
#ping <IP nt02>
success
#ping <IP nt03>
not success, since its diff bridge
```
## Hands-On - backend and frontend
backend



- Dispaly and create bridge
```
docker network ls
docker network inspect bridge
docker network create devops-net
docker network ls
```

- Run first container (backend)
```
docker run -d \
  --name backend \
  --network devops-net \
  nginx
```

- Run second container (frontend)

```
docker run -d \
  --name frontend \
  --network devops-net \
  busybox \
  sleep 3600
```

- Test container-to-container communication and display
  - Subnet, Gateway, Connected containers, IPs assigned automatically
```
docker exec -it frontend sh
  # Inside container:
ping backend
  # Exit
docker network inspect devops-net
```

- Connect running container to another network
```
docker network connect bridge frontend
```

- Now frontend has 2 network interfaces.

```
docker inspect frontend
```
- Disconnect from a network and clean up
```
docker network disconnect bridge frontend
docker rm -f frontend backend
docker network rm devops-net
```
