# Jekins介绍

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

  
