# phengleiatpweb

## 环境要求

需要安装以下开发环境：

1. 本地安装mysql数据库
2. vscode
3. nodejs
4. yarn

以上环境确保都安装成功后再进行下面的操作

## 使用说明

#### 一、测试数据导入

将 ```case_test.sql``` 导入数据库

#### 二、模块加载

分别进入 ```frontend``` 目录和 ```server``` 目录，输入 ```yarn``` 进行项目的初始化工作

#### 三、项目启动

进入 ```server``` 目录，输入 ```yarn start``` 启动后端服务

进入 ```frontend``` 目录，输入 ```yarn start``` 启动前端服务

全部启动后，进入浏览器输入 ```127.0.0.1:8000``` 即可访问项目

#### 四、代码修改

更改前端代码后，不用重启服务，由于前端带有热更新，代码保存后浏览器会自动刷新。

更改后端代码后需要手动重启服务。