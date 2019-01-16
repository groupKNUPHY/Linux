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
 - Example.1
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

 - Make new image using your container
If you install some programs or change some values in you container and    
the changed information is applied to the image, you can use [commit] commands.  
This can makes new image by using your working container
```bash
docker commit CONTAINER_ID NAME_OF_NEW_IMAGE
```


