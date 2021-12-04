# buaacourse

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 文件树结构

在android目录下：

* assets：存放图片和图标
* lib
  * jsons：对象的json结构
  * models：对象的类
  * screens：各个页面
    * course：有关课程列表的页面（含有http请求）
    * home：主页面（包含主页面导航）
      * home.dart、home_detail.dart、home_http.datr为首页代码
      * home_screen.dart是整体样式（底部导航）
      * user.dart是用户页面
    * login：登录和注册页面（含有http请求）
  * my_course：我的课表页面，现在有很大问题：数据为写死的展示数据
  * test：没用的测试文件，测试时直接新建，然后直接用在main里打开即可测试
  * constants：有各种全局常量（颜色等）
  * main：整个app的入口
* pubspec.yaml：依赖
* README：一个没什么用的说明文档，**阅读代码前必看**！
