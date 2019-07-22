import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './Services.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          height: height - 120,
          margin: EdgeInsets.only(top: 120, left: 50, right: 50),
          child: Stack(
            overflow: Overflow.clip,
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset("images/seasun.png", width: 249, height: 98,),
              ),

              Padding(
                padding: EdgeInsets.only(top: 120),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: usernameController,
                        onEditingComplete: () {

                        },
                        keyboardAppearance: Brightness.light,
                        maxLength: 30,
                        decoration: InputDecoration(
                          hintText: "用户名",
                          counterStyle: TextStyle(fontSize: 0),
                          prefixIcon: Icon(Icons.person_pin),
                          contentPadding: EdgeInsets.all(9),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue[400], width: 1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue[400], width: 1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue[400], width: 1),
                            borderRadius: BorderRadius.circular(30)
                          )
                        ),
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        controller: passwordController,
                        onEditingComplete: () {
                          _login(usernameController.text.toString(), passwordController.text.toString()).then((val) {
                            print(val);
                          });
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "密码",
                          prefixIcon: Icon(Icons.vpn_key),
                          contentPadding: EdgeInsets.all(9),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue[400], width: 1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue[400], width: 1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue[400], width: 1),
                            borderRadius: BorderRadius.circular(30)
                          )
                        ),
                      ),
                      SizedBox(height: 30,),

                      CupertinoButton(
                        onPressed: () {
                          _login(usernameController.text.toString(), passwordController.text.toString()).then((val) {
                            print(val['message']);
                          });
                        },
                        child: Icon(FontAwesomeIcons.arrowRight),
                        color: Colors.blue[700],
                        padding: EdgeInsets.only(left: (width - 100) / 2, right: (width - 100) / 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                width: width - 170,
                left: 35,
                bottom: 40,
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("忘记密码"),
                          Text("|"),
                          Text("修改密码")
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("登录即代表阅读并同意 "),
                          InkWell(
                            child: Text("服务协议", style: TextStyle(color: Colors.blue[700])),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ServicesPage()));
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }

  Future _login(String username, String password) async {
    Response response;
    try {
      response = await Dio().post("http://10.11.135.165:9999/login", data: {"username": username, "password": password});
      return response.data;
    } catch(e) {
      print(e);
    }
  }

}
