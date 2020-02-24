# Jekins+k8s实现持续集成

* 目标

1、基本了解docker、k8s、持续集成、jenkis

2、掌握docker、k8s、Jenkins的基本使用

3、掌握如何使用Jenkis+k8s实现持续集成与测试环境的自动化管理

* 课程使用案例

1、一个spring boot项目，使用Jenkins自动化编译、打包、发布

2、项目地址：https://github.com/solochen84/SpringBootDemo

## k8s介绍

0、K8s是什么？

k8s是基于容器技术的分布式架构领先方案。它是google严格保密十几年的秘密武器Brog的一个开源版本；是Google开源的一个容器编排引擎，支持自动化部署、大规模可伸缩、应用容器化管理。

```shell
#kubectl create -f test.yml

#kubectl apply -f /root/kube.yaml

#kubectl get services --all-namespaces
```

1、K8s能做什么？

容器的自动化复制和部署。随时扩展或收缩容器规模，并提供负载均衡。

方便地容器升级。

提供容器弹性，如果失效就替换它。

2、K8s对于测试能做什么？

测试服务器的集中化、自动化管理。将各种平台的服务器加入集群，按需部署或销毁

持续集成是方便地自动部署

3、K8s架构

![](https://img2.mukewang.com/5d3f9b880001bc7204880477.jpg)

4、K8s基本概念

Master是主服务器，node是用于部署应用容器的服务器

Pod基本操作单元，也是应用运行的载体。整个kubernetes系统都是围绕着Pod展开的，比如如何部署运行Pod、如何保证Pod的数量、如何访问Pod等。

Deployment定义了pod部署的信息。

若干个pod副本组成一个service，对外提供服务

副本是指一个pod的多个实例

Namespace 用于多租户的资源隔离。在测试环境中可以根据namespace划分成多套测试环境。默认有2个namespace；kube-system/default

5、K8s调度过程

kubernetes client将请求发送给API server

API Server根据请求的类型，将处理的结果存入高可用键值存储系统Etcd中

Schedule将未分发的Pod绑定（bind）到可用的Node节点上，存到etcd中

Controller Manager根据etcd中的信息，调用Node中的kubelet创建pod

Controller Manager监控pod的运行状况并确保运行正常


## 持续集成

#### 持续集成介绍，敏捷开发

1、持续集成是一种软件开发实践

2、团队开发成员经常集成他们的工作，每个成员每天至少集成一次

3、每天可能会发生多次集成

4、每次集成都通过自动化的构建（包括编译、打包、部署、自动化测试）来验证

5、尽早地发现集成错误

#### Jenkins 是什么?
Jenkins是一款开源 CI&CD 软件，用于自动化各种任务，包括构建、测试和部署软件。

Jenkins 支持各种运行方式，可通过系统包、Docker 或者通过一个独立的 Java 程序。



#### 章节介绍

1、Registry安装配置和使用
docker pull registry

docker run -p 5000:5000 -v /home/registry_images::var/lib/registry -d registry

2、Jenkin项目创建与配置

3、Jenkin项目构建




## 参考：
慕课地址
https://www.imooc.com/video/19163