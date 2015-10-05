title: Hadoop安装与配置
date: 2015-10-04 22:37:50
tags: ［Hadoop,Work］
categories: Work
description: Hadoop安装与配置
---

# hadoop安装指南

## VMware配置

1. 把自己的虚拟机实例网卡设置为NAT方式上网，不要选择桥接自动。

2. 打开vmware。点击“编辑”菜单，选择网络编辑啥的。然后选择net8，也就是NAT。去掉DHCP那个checkbox, 并记下子网ip

	![VMware配置](http://7xkgp0.com1.z0.glb.clouddn.com/15-10-3/29714382.jpg)

3. 点击NAT设置，记下网关

4. 打开虚拟机 编辑网络连接 选择手动 填写ip 要和子网在一个网段内。 网关是NAT设置里的网关。DNS是自己电脑的DNS就可以了。

	![Red Hat配置](http://7xkgp0.com1.z0.glb.clouddn.com/15-10-3/69295158.jpg)

5. 关闭防火墙   `chkconfig iptables off`

## hostname和hosts的配置

1. 通过`vi /etc/sysconfig/network`修改hostname

	![hostname](http://7xkgp0.com1.z0.glb.clouddn.com/15-10-4/11647350.jpg)

2. 通过`vi /etc/hosts`，添加 Master、Slave1、Slave2的IP地址

	![hosts](http://7xkgp0.com1.z0.glb.clouddn.com/15-10-4/58978306.jpg)

## 添加hadoop用户和用户组

- 创建Hadoop用户组：`groupadd hadoop`

- 创建Hadoop用户：`useradd hadoop -g hadoop`

- 设置Hadoop用户密码：`passwd   密码`

- 给hadoop账户增加sudo权限： `vim /etc/sudoers` ，增加内容：`hadoop ALL=(ALL) ALL`

## 无密码登录ssh

- 切换到Hadoop 用户下：`su hadoop    cd /home/hadoop/`

- 生成公钥和私钥：`ssh-keygen -q -t rsa -N "" -f /home/hadoop/.ssh/id_rsa`

- 查看密钥内容：`cd /home/hadoop/.ssh   cat id_rsa.pub`

- 复制id rsa.pub公钥到 authorized keys 文件：`cat id_rsa.pub > authorized_keys`

- 修改Master公钥权限：`chmod 644 /home/hadoop/.ssh/authorized_keys`

- 把 Master 机器上的 authorized_keys 文件 copy 到 Slave1 节点上：`scp /home/hadoop/.ssh/authorized_keys Slave1.Hadoop:/home/hadoop/.ssh/`,如果Slave1/Slave2机器上没有.ssh目录，则创建，并`chmod 700 /home/hadoop/.ssh`

> note: Exception：Agent admitted failure to sign using the key.   Solution： `ssh-agent bash --login -i`和 `ssh-add ~/.ssh/id_rsa`

## 安装hadoop

1. 转到 home/hadoop目录：`cd /home/hadoop`

2. 下载hadoop：`wget http://mirror.bit.edu.cn/apache/hadoop/common/hadoop-2.6.1/hadoop-2.6.1.tar.gz`

3. 解压hadoop并放到计划安装位置：`tar zxvf hadoop-2.6.1.tar.gz` 

4. 创建文件目录：`mkdir -p /home/hadoop/hadoop-2.6.1/dfs/name /home/hadoop/hadoop-2.6.1/dfs/data /home/hadoop/hadoop-2.6.1/tmp`

5. 修改7个配置文件，文件位置：`/home/hadoop/hadoop-2.6.1/etc/hadoop/`，文件名称：`hadoop-env.sh`、`yarn-env.sh`、`mapred-env.sh`、`slaves`、`core-site.xml`、`hdfs-site.xml`、`mapred-site.xml`、`yarn-site.xml`

6. scp到对应的slave机器上 `scp -r /home/hadoop/hadoop-2.6.1 Slave1.Hadoop:~/`  `scp -r /home/hadoop/hadoop-2.6.1 Slave2.Hadoop:~/`


```
#hadoop-env.sh
export JAVA_HOME=/usr/java/jdk1.7.0_79

#mapred-env.sh
export JAVA_HOME=/usr/java/jdk1.7.0_79

#yarn-env.sh
export JAVA_HOME=/usr/java/jdk1.7.0_79

#slaves
Slave1.Hadoop
Slave2.Hadoop

#core-site.xml
<property>
    <name>fs.defaultFS</name>
    <value>hdfs://192.168.109.10:9000</value>
</property>
<property>
    <name>hadoop.tmp.dir</name>
    <value>/home/hadoop/hadoop-2.6.1/tmp</value>
    <description>Abase for other temporary directories.</description>
</property>

#hdfs-site.xml
<property>
    <name>dfs.namenode.secondary.http-address</name>
    <value>192.168.109.10:50090</value>
</property>
<property>
    <name>dfs.namenode.name.dir</name>
    <value>/home/hadoop/dfs/name</value>
</property>
<property>
    <name>dfs.datanode.data.dir</name>
    <value>/home/hadoop/dfs/data</value>
</property>
<property>
    <name>dfs.replication</name>
    <value>2</value>
</property>

#mapred-site.xml
<property>
    <name>mapreduce.framework.name</name>
    <value>yarn</value>
</property>

#yarn-site.xml
<property>
    <name>yarn.resourcemanager.hostname</name>
    <value>Master.Hadoop</value>
</property>
<property>
    <name>yarn.nodemanager.aux-services</name>
    <value>mapreduce_shuffle</value>
</property>
```

## 启动Hadoop
1. 切换到hadoop用户：`su hadoop`

2. 进入安装目录： `cd  ~/hadoop-2.6.1/`

3. 格式化namenode：`./bin/hdfs namenode –format`

4. 启动hdfs: `./sbin/start-dfs.sh`

5. jps查看，此时master有进程：`NameNode` `SecondaryNameNode`，slave1/slave2上有进程：`DataNode` 

6. 启动yarn: `./sbin/start-yarn.sh`

7. jps查看，此时master有进程：`NameNode` `SecondaryNameNode` `ResourceManager`，slave1/slave2上有进程：`DataNode` `NodeManager`

8. 查看集群状态：`./bin/hdfs dfsadmin -report`

9. 查看文件块组成：  `./bin/hdfs fsck / -files -blocks`

10. Web查看HDFS:    [Web查看HDFS](http://192.168.109.10:50070)

11. Web查看RM:    [Web查看RM](http://192.168.109.10:8088)
