# Jekins介绍


1、Jenkins使用方法

2、典型的从代码到测试环境的自动部署方法

3、部署的思路有通用性，但是具体实践各不同

![](https://img1.mukewang.com/5b725305000109ac03641000.jpg)


## Jekins 安装

安装 https://jenkins.io/

下载 Generic Java package (.war)

执行以下命令来启动 java -jar jenkins.war

启动后，admin登陆，设置用户名和密码

系统管理-可选插件-search rebuilder； search 'safe restart' 安装两个插件


## Jekins基础设置

1.配置全局安全属性

   系统管理-->configure GlobalSecurity-->授权策略-->安全矩阵-->添加用户组(填写建立jenkins时创建的用户)-->添加-->用户所在行右侧全选-->保存

2.添加用户

  系统管理-->管理用户-->新建用户(添加用户名 密码等信息)-->重复上一步，为新建的用户赋予权限，可以赋予其除了administerReadr以外的权限

##  Jekins自动化部署任务开发
#### jenkins自动化部署过程

1、git同步最新代码

2、maven打包

3、停止Tomcat

4、部署应用

5、启动Tomcat

自动化部署的代码deploy.sh

```shell
#!/usr/bin/env bash
#编译+部署order站点

#需要配置如下参数
# 项目路径, 在Execute Shell中配置项目路径, pwd 就可以获得该项目路径
# export PROJ_PATH=这个jenkins任务在部署机器上的路径

# 输入你的环境上tomcat的全路径
# export TOMCAT_APP_PATH=tomcat在部署机器上的路径

### base 函数
killTomcat()
{
    pid=`ps -ef|grep tomcat|grep java|awk '{print $2}'`
    echo "tomcat Id list :$pid"
    if [ "$pid" = "" ]
    then
      echo "no tomcat pid alive"
    else
      kill -9 $pid
    fi
}
cd $PROJ_PATH/order
mvn clean install

# 停tomcat
killTomcat

# 删除原有工程
rm -rf $TOMCAT_APP_PATH/webapps/ROOT
rm -f $TOMCAT_APP_PATH/webapps/ROOT.war
rm -f $TOMCAT_APP_PATH/webapps/order.war

# 复制新的工程
cp $PROJ_PATH/order/target/order.war $TOMCAT_APP_PATH/webapps/

cd $TOMCAT_APP_PATH/webapps/
mv order.war ROOT.war

# 启动Tomcat
cd $TOMCAT_APP_PATH/
sh bin/startup.sh
```


#### 创建Jenkins部署任务

1、创建Jenkins任务

2、填写Server信息
Restrict where this project can ben run:
Local Expression: TestEnv(前面配的测试环境）这一步需要选择

3、配置git参数

4、填写构建语句，实际部署测试环境

Execute shell的脚本配置

```shell
BUILD_ID=DONTKILLME
#加载配置参数
. /etc/profile 

#配置运行参数
export PROJ_PATH=`pwd`
export TOMCAT_APP_PATH=/opt/tomcat

#运行部署脚本
sh $PROJ_PATH/order/deploy.sh
```

#### 运行部署任务

1、执行Jenkins部署任务

2、确定执行结果成功

3、打开浏览器访问部署应用程序

4、确定发布结果的正确性



## 基于Docker+Jenkins实现自动化部署

https://www.cnblogs.com/ming-blogs/p/10903408.html


```shell
docker run -p 8080:8080 -p 50000:50000 -v jenkins_data:/var/jenkins_home jenkinsci/blueocean
```

$docker exec -it 
/ $ cat /var/jenkins_home/secrets/initialAdminPassword
400165bc916048e98afe0ef458e141cd


Jenkins全局工具配置
进入到jenkins容器中 echo $JAVA_HOME 获取java环境安装地址
/ $ echo $JAVA_HOME
/usr/lib/jvm/java-1.8-openjdk

 
- JDK环境安装
- Maven环境安装


#### Jenkins启动成功之后执行shll脚本
```
#!/bin/bash

#服务名称

SERVER_NAME=springboot

# 源jar路径,mvn打包完成之后，target目录下的jar包名称，也可选择成为war包，war包可移动到Tomcat的webapps目录下运行，这里使用jar包，用java -jar 命令执行  

JAR_NAME=springboot-0.0.1-SNAPSHOT

# 源jar路径  

#/usr/local/jenkins_home/workspace--->jenkins 工作目录

#demo 项目目录

#target 打包生成jar包的目录

JAR_PATH=/var/jenkins_home/workspace/springboot/target

# 打包完成之后，把jar包移动到运行jar包的目录--->work_daemon，work_daemon这个目录需要自己提前创建

JAR_WORK_PATH=/var/jenkins_home/workspace/springboot/target

 

echo "查询进程id-->$SERVER_NAME"

PID=`ps -ef | grep "$SERVER_NAME" | awk '{print $2}'`

echo "得到进程ID：$PID"

echo "结束进程"

for id in $PID

do

kill -9 $id  

echo "killed $id"  

done

echo "结束进程完成"

 

#复制jar包到执行目录

echo "复制jar包到执行目录:cp $JAR_PATH/$JAR_NAME.jar $JAR_WORK_PATH"

cp $JAR_PATH/$JAR_NAME.jar $JAR_WORK_PATH

echo "复制jar包完成"

cd $JAR_WORK_PATH

#修改文件权限

chmod 755 $JAR_NAME.jar

 

Nohub  java -jar $JAR_NAME.jar
```

#### 如何获得docker容器里面的root权限

- sudo docker exec -ti -u root 7509371edd48 bash

#### Docker容器和本机之间的文件传输

- docker cp hostfile 7509371edd48:/path/dockerfile



#### 容器映射8081端口
1. 重启容器

systemctl restart  docker  

 2. 清空未运行的容器

docker rm $(sudo docker ps -a -q)

docker run -p 8080:8080   -p 8081:8081   -p 50000:50000 -v jenkins_data:/var/jenkins_home jenkinsci/blueocean


## 参考：
项目的地址:https://github.com/princeqjzh/order

应用部署小程序，练习用

运行sql(order/src/main/sql/order.sql)语句，配置数据库;
根据自己数据库服务器的实际参数配置applicationContext.xml中的相应参数; a）DB Host b）DB Port c）DB Username d）DB Password
完成配置之后能可以运行spring程序;