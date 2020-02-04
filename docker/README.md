
## 学习Dockerfile文件的编写

* 1.新建一个最简单的docker

```
FROM alpine:latest
MAINTAINER xbf
CMD echo 'hello docker'
```

在当前目录下新建并运行：
$docker build -t hello_docker .
$docker run hello_docker 


* 2.新建nginx的docker镜像
```
FROM ubuntu
MAINTAINER endlif
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list 
RUN apt-get update
RUN apt-get install -y nginx
COPY index.html /var/www/html
ENTRYPOINT [ "/usr/sbin/nginx","-g","daemon off;"]
EXPOSE 80
```

在当前目录下新建并运行：
$docker build -t endlif/hello-nginx .
$docker run -d -p 80:80 endlif/hello-nginx 


测试：
curl http://localhost


* 3.镜像的分层
container layer 分的这一层是可读可写的


## Volume: 提供了独立于容器之外的持久化存储

使用容器时遇到的问题：
运行容器时，在容器中的改动是不会被保存的，或者缺省是不会被保存的，那么volume提供了持久化保存的技巧。比如进行数据库的操作，运行数据库的容器，那么数据库的数据。

解决的办法
Volume 的基本操作  -v 参数指定 volume 的路径， 然后再用 inspect 查看 volume 映射到硬盘上的路径， 然后再直接更改硬盘上的文件。
容器和宿主机目录挂载的三种方式：

1.第一种方式：

```
# 运行容器内部地址nginx用来访问网页的地址/usr/share/nginx/html 
docker run -d --name nginx -v /usr/share/nginx/html nginx
#给出容器的所有信息
docker inspect nginx 
> Mounts.Source  宿主机目录 [如果是mac，则该路径不是mac上的实际路径，因为mac上运行docker是还有一层虚拟层,这是docker虚拟层中的路径，可以在docker中访问到]
> Mounts.Destination:/usr/share/nginx/html/ 容器目录
screen ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/tty [这个路径才是mac本身挂载的目录]
```

2.第二种方式：
```
#将当前目录下的html子目录挂载到容器中中的/var/www/html
docker run -p 80:80 -d -v $PWD/html:/var/www/html nginx
```

3.第三种方式：
```
# 宿主机目录：$PWD/data docker目录：/var/mydata  容器名：data_container 基础镜像：ubuntu
docker create -v $PWD/data:/var/mydata --name data_container ubuntu
# -it表示使用交互的方式进入容器[默认ubuntu基础镜像没有服务]
docker run -it --volumes-from data_container ubuntu /bin/bash
#进入后执行mount,可以看到有/var/mydata目录的挂载信息
mount
```

