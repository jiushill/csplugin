## 信息收集 ##
功能:
* usb历史记录信息收集
* 判断是否存在域
* 获取系统盘符
* 获取已安装的软件
* 系统基本信息获取
* 网络信息查询
* 配置查询
* 用户查询
* 用户组查询
* netsh端口转发设置
  * netsh端口转发列表查询
  * netsh端口转发删除
* 常用软件信息收集
  * 向日葵信息收集

## 权限维持 ##
功能：
* cs自带的beacon服务马  
*  winrm后门  
* msdtc DLL劫持  
* WmiPrvSE提权/权限维持
* CacheTask任务计划COM接口劫持 (适用于:windows 10/windows 2012以上)
* RID劫持
* lnk快捷键劫持
* java运行class文件
* dnsadmin账号组进行dns.dll劫持 （适用于域）
* userAccountControl将ID设置为8192作为域控（适用于域）
* 以某个进程的Token运行EXE
* C#添加计划任务

待开发..............


## cs自带的beacon服务马 ##
![](img/service/Servicebeacon.png)
![](img/service/system_beacon.png)

## msdtc DLL劫持 ##
![](img/msdtc/msdtc.png)
![](img/msdtc/msdtc2.png)

## WmiPrvSE提权/权限维持 ##
![](img/WmiPrvSE/7.png)
![](img/WmiPrvSE/2008.png)

## CacheTask任务计划COM接口劫持 ##
![](img/CacheTask/CacheTask.png)
![](img/CacheTask/CacheTask2.png)
![](img/CacheTask/CacheTask.gif)

## Rid劫持 ##
![](img/rid/1.png)
![](img/rid/0.png)
![](img/rid/2.png)
![](img/rid/4.png)
![](img/rid/6.png)

## lnk快捷键劫持 ##  
![](img/lnkhijack/1.png)
![](img/lnkhijack/2.png)
![](https://z3.ax1x.com/2021/10/19/5a4Ucn.gif)

## java运行class文件 ##
![](img/javarun/run.png)

## userAccountControl将ID设置为8192作为域控 ##
![](img/userAccountControl/1.png)
![](img/userAccountControl/2.png)
![](img/userAccountControl/3.png)
![](img/userAccountControl/4.png)

## 向日葵信息收集 ##
![](img/SunloginClient/SunloginClient.png)

## 以某个进程的Token运行EXE ##
![](img/tokenrun/1.png)
![](img/tokenrun/2.png)

## C#添加计划任务 ##
ConsoleApp1.cs是源码，需要依赖Interop.TaskScheduler.dll。这里利用了ILMerge打包成了addtask.exe,.NET 2.0  
![](img/schtasks/1.png)
![](img/schtasks/2.png)
![](img/schtasks/3.png)
