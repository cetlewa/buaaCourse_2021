import 'package:flutter/material.dart';

class ForgetPwd extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("忘记密码"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            TextButton(
              child: Text("十分抱歉\n我们暂不支持密码找回功能Σ( ° △ °|||)︴\n"
                  "烦请您发邮件给管理员以说明具体情况：\n"
                  "管理员cms：19373533@buaa.edu.cn", style: TextStyle(fontSize: 20.0),),
              onPressed: (){
                Navigator.pushNamed(context, "login_page");
              },
            ),
            Image.asset("assets/images/sorry.jpeg"),
          ],
        ),
      ),
    );
  }

}