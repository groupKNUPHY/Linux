### Docker  
 - Start docker
```bash
$ sudo systemctl start docker
```  
 - Delete all containers
```bash
$ docker stop $(docker ps -a -q)
$ docker rm $(docker ps -a -q)
```  
 - Delete all images
```bash
$ docker rmi $(docker images -q)
```

