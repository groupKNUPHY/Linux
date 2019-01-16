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
 - Excute a container generating new container
```bash
$ docker run [OPTION] CONTAINER_ID COMMAND
```  
 - Give orders to running container
```bash
$ docker exec [OPTION} CONTAINER_ID COMMAND
```
 	- Example
Go to the inside of running tensorflow conatainer [/bin/bash] with keyboard option [it]
```bash
$ docker exec -it CONTAINER_ID /bin/bash
```  
Then, you can see the terminal interface similar to that of LINUX  
Moreover, LINUX commands works well  
To clarifiy the OS of images,
```bash
$ uname -a
$ cat /etc/issue
```  
This is Ubuntu base



