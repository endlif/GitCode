# AndroidSoketServer  一个不错的http协议学习demo
```
在android平台测试soket服务器的demo
用soket服务在android平台接收post和get及上传图片的demo
```


## 配置模拟器测试环境
虽然本级和模拟机在同一个机器上，但是不能通过本地的ip直接访问。需要进行设置。

1、需要进行端口映射：
telnet localhost 5554

2、将本地的端口隐射到模拟器的端口
redir add tcp:8088:8088

redir命令执行失败

3、telent与server通信telnet ip port 

telnet localhost  8088



遇到的问题：
telnet localhost 5554连上模拟器后，使用redir时，系统提示
redir
KO: unknown command, try 'help'
解决办法：
需要配置auth根据提示，auth_token是存储在/home/username/.emulator_console_auth_token中。打开文件，复制文件中的代码（auth_token）.
接下来执行： 'auth + auth_token'
然后再来看看help命令, redir 就出来了。



#参考：
https://blog.csdn.net/jianiuqi/article/details/53350184