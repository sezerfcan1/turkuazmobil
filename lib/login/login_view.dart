import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:turkuazmobil/resources/background_image.dart';
import 'package:turkuazmobil/resources/button.dart';
import 'package:turkuazmobil/resources/password_input.dart';
import 'package:turkuazmobil/resources/text_input.dart';

import 'login_logic.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final logic = Get.find<LoginLogic>();
  TextEditingController _mail = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Obx(() {
          if (logic.getLoading()) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: LoginScreen(mail: _mail, password: _password, logic: logic),
            );
          }
        }),
      ],
    );
  }

  @override
  void dispose() {
    Get.delete<LoginLogic>();
    super.dispose();
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key key,
    @required TextEditingController mail,
    @required TextEditingController password,
    @required this.logic,
  })  : _mail = mail,
        _password = password,
        super(key: key);

  final TextEditingController _mail;
  final TextEditingController _password;
  final LoginLogic logic;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30,horizontal: 10),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Image.asset('assets/images/logo.png',scale: 0.001,),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Column(
                      children: [
                        TextInput(
                          icon: FontAwesomeIcons.users,
                          hint: 'Mail',
                          inputType: TextInputType.emailAddress,
                          inputAction: TextInputAction.next,
                          inputString: _mail,
                        ),
                        PasswordInput(
                          icon: FontAwesomeIcons.lock,
                          hint: 'Şifre',
                          inputAction: TextInputAction.done,
                          inputString: _password,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoginButtonWidget(mail: _mail, password: _password, logic: logic),
                        SizedBox(width: 10,),
                        SignUpButtonWidget(mail: _mail, password: _password, logic: logic),
                      ],
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

