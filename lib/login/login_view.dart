import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:turkuazmobil/api_client/login_api_client.dart';
import 'package:turkuazmobil/resources/background_image.dart';
import 'package:turkuazmobil/resources/palette.dart';
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
    return Center(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 150,
                child: Center(
                  child: Text(
                    'Turkuaz',
                    style: kHeading,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
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
                    Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                          child: Text('    Giriş Yap    '),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0x6B2FE2D3)),
                            animationDuration: Duration(seconds: 3),
                          ),
                          onPressed: () {
                            if (_mail.text == '' || _password.text == '' || _mail.text == null || _password.text == null) {
                              Get.snackbar('Uyarı', 'Lütfen mail ve şifrenizi giriniz!',
                                  backgroundColor: Color(0xEB992C11));
                            }else {
                              logic.setLogin(
                                  mail: _mail.text, password: _password.text);
                              logic.getLoginInfo();
                            }
                          },
                        ),
                        SizedBox(
                          height: 80,
                        ),
                      ],
                    )
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
