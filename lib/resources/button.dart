import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkuazmobil/login/login_logic.dart';
import 'package:turkuazmobil/resources/palette.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    Key key,
    @required TextEditingController mail,
    @required TextEditingController password,
    @required this.logic,
  }) : _mail = mail, _password = password, super(key: key);

  final TextEditingController _mail;
  final TextEditingController _password;
  final LoginLogic logic;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if (_mail.text == '' || _password.text == '' || _mail.text == null || _password.text == null) {
          Get.snackbar('Uyarı', 'Lütfen mail ve şifrenizi giriniz!',
              backgroundColor: Color(0xEB992C11));
        }else {
          logic.setLogin(
              mail: _mail.text, password: _password.text);
          logic.getLoginInfo();
        }
      },
      child: Container(
        height: 50,
        width: 130.0,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            offset: Offset(0.0,20.0),
            blurRadius: 30.0,
            color: Colors.black12,
          )],
          color: Colors.white,
          borderRadius: BorderRadius.circular(22.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 100.0,
              height: double.infinity,
              child: Center(child: Text('Giriş Yap',style: Theme.of(context).textTheme.button.apply(color: Colors.black),)),
              decoration: BoxDecoration(
                  color: color2,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80.0),
                    topLeft: Radius.circular(80.0),
                    bottomRight: Radius.circular(200.0),
                  )
              ),
            ),
            Icon(
              Icons.home,
              size: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpButtonWidget extends StatelessWidget {
  const SignUpButtonWidget({
    Key key,
    @required TextEditingController mail,
    @required TextEditingController password,
    @required this.logic,
  }) : _mail = mail, _password = password, super(key: key);

  final TextEditingController _mail;
  final TextEditingController _password;
  final LoginLogic logic;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if (_mail.text == '' || _password.text == '' || _mail.text == null || _password.text == null) {
          Get.snackbar('Uyarı', 'Lütfen mail ve şifrenizi giriniz!',
              backgroundColor: Color(0xEB992C11));
        }else {
          logic.setLogin(
              mail: _mail.text, password: _password.text);
          logic.getLoginInfo();
        }
      },
      child: Container(
        height: 50,
        width: 130.0,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            offset: Offset(0.0,20.0),
            blurRadius: 30.0,
            color: Colors.black12,
          )],
          color: Colors.white,
          borderRadius: BorderRadius.circular(22.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 100.0,
              height: double.infinity,
              child: Center(child: Text('Kayıt Ol',style: Theme.of(context).textTheme.button.apply(color: Colors.black),)),
              decoration: BoxDecoration(
                  color: color2,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80.0),
                    topLeft: Radius.circular(80.0),
                    bottomRight: Radius.circular(200.0),
                  )
              ),
            ),
            Icon(
              Icons.home,
              size: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}

