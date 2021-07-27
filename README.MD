# 简介

基于 Spring Cloud Alibaba 的前后端分离微服务在线教育项目，整合了 Spring Security（用户认证（Authentication）和用户授权（Authorization）），缓存 Redis，以及 alibaba 全套服务发现，服务配置，服务调用，流量控制（hystrix），监控等



# 项目展示

### 后台登录页面

![image-20210727182721299](README.assets/image-20210727182721299.png)



### 权限管理页面

![image-20210727182750778](README.assets/image-20210727182750778.png)

![image-20210727182824728](README.assets/image-20210727182824728.png)

![image-20210727182808751](README.assets/image-20210727182808751.png)



### 教师管理页面

![image-20210727184137662](README.assets/image-20210727184137662.png)

![image-20210727184355601](README.assets/image-20210727184355601.png)

![image-20210727184418246](README.assets/image-20210727184418246.png)



### 课程管理页面

![image-20210727184440267](README.assets/image-20210727184440267.png)

![image-20210727184516239](README.assets/image-20210727184516239.png)

![image-20210727184819508](README.assets/image-20210727184819508.png)



### 数据统计模块

![image-20210727185035874](README.assets/image-20210727185035874.png)

![image-20210727185005419](README.assets/image-20210727185005419.png)



### 前台首页

![image-20210727185247416](README.assets/image-20210727185247416.png)

![image-20210727185303186](README.assets/image-20210727185303186.png)



### 注册页面

![image-20210727190054604](README.assets/image-20210727190054604.png)



### 登陆页面

![image-20210727185332951](README.assets/image-20210727185332951.png)



### 微信登录页面

![image-20210727185428507](README.assets/image-20210727185428507.png)



### 微信登录成功页面

![image-20210727185504852](README.assets/image-20210727185504852.png)



### 课程展示页面

![image-20210727185551586](README.assets/image-20210727185551586.png)

![image-20210727185622146](README.assets/image-20210727185622146.png)

![image-20210727185928716](README.assets/image-20210727185928716.png)

![image-20210727190223929](README.assets/image-20210727190223929.png)



### 购买课程权限验证

![image-20210727190159990](README.assets/image-20210727190159990.png)



### 课程支付

![image-20210727190552809](README.assets/image-20210727190552809.png)

![image-20210727190609277](README.assets/image-20210727190609277.png)

![image-20210727190754010](README.assets/image-20210727190754010.png)

![image-20210727190807495](README.assets/image-20210727190807495.png)



### 课程视频观看页面

![image-20210727194506650](README.assets/image-20210727194506650.png)



### 教师展示页面

![image-20210727185812803](README.assets/image-20210727185812803.png)

![image-20210727185839595](README.assets/image-20210727185839595.png)



# 需求分析

![image-20210727181946655](README.assets/image-20210727181946655.png)



# 数据表结构

![image-20210727182348390](README.assets/image-20210727182348390.png)



# 模块说明

	|- education_parent
		|- common			|| 公共模块
			|- utils			|| 存放各种工具
			|- base				|| 全局bean，全局设置等
			|- spring_security		|| spring_security专用设置, 与service_acl模块相连
		|- infrastructure		|| 微服务api网关
		|- service			|| 微服务模块									
			|- service_edu			|| 提供主要服务api接口
			|- service_oss                  || 文件上传至阿里云oss
			|- service_vod			|| 视频点播，上传至阿里云oss
			|- service_cms			|| 控制前台首页数据
			|- service_center		|| 用户登录注册模块
			|- service_order		|| 订单模块
			|- service_statistic		|| 统计模块
			|- service_acl			|| 后台管理权限控制



# 使用技术栈

|         框架          |                       使用内容                        |     版本      |
| :-------------------: | :---------------------------------------------------: | :-----------: |
|         mysql         |                        数据库                         |      5.6      |
|     Mybatis-Plus      |                   为Mybatis简化开发                   |     3.0.5     |
|         redis         |         缓存数据库，为spring、mybatis提供缓存         |     6.2.1     |
|      SpringBoot       |                Spring快速开发的脚手架                 | 2.2.1.RELEASE |
|         Nacos         |                 服务注册、发现、配置                  | 0.2.2.RELEASE |
| Spring Cloud Gateway  |          服务网关，负责请求转发，负载均衡等           | 0.2.2.RELEASE |
|        Swagger        |                     生成接口文档                      |     2.7.0     |
|        hystrix        |                    服务熔断、降级                     | 0.2.2.RELEASE |
| Spring Cloud Security | 用户认证（Authentication）和用户授权（Authorization） | 2.2.1.RELEASE |
|       OpenFeign       |           Http客户端，负责微服务之间的调用            | 0.2.2.RELEASE |



# 其他技术

httpclient+fastjson+easyexcel+阿里云OSS + 视频点播 + 云短信 + 微信支付

