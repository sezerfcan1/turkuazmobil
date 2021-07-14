import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Constant {
  static const baseUrl = 'http://192.168.1.37:1000';


  static showConnectError(){Get.snackbar('Bağlantı Hatası',
  'Sunucu ile bağlantı sağlanamadı. En kısa sürede onarım sağlanacaktır.',
  forwardAnimationCurve: Curves.bounceInOut,
  colorText: Color(0xFFFFFFFF),
  backgroundColor: Color(0xD2EF0E0E),
  overlayBlur: 5);}

  static showBadRequest(){Get.snackbar('Hatalı Deneme',
      'Lütfen bilgilerinizi kontrol edip tekrar deneyiniz',
      forwardAnimationCurve: Curves.bounceInOut,
      colorText: Color(0xFFFFFFFF),
      backgroundColor: Color(0xD2EF0E0E),
      overlayBlur: 5);}

  static showTooManyRequest(){Get.snackbar('Sürekli hatalı deneme yapıldı',
      'Lütfen kullanıcı adı ve şifrenizi kontrol edip 3 dakika sonra tekrar deneyiniz',
      forwardAnimationCurve: Curves.bounceInOut,
      colorText: Color(0xFFFFFFFF),
      backgroundColor: Color(0xD2EF0E0E),
      overlayBlur: 5);}

  static showUnauthorized(){Get.snackbar('Hata',
      'Oturumunuz sona ermiştir. Lütfen uygulamadan çıkıp tekrar giriş yapmayı deneyin.',
      forwardAnimationCurve: Curves.bounceInOut,
      colorText: Color(0xFFFFFFFF),
      backgroundColor: Color(0xD2EF0E0E),
      overlayBlur: 5);}

  static unexpectedError(){Get.snackbar('Hata',
      'Beklenmeyen bir hata oluştu.',
      forwardAnimationCurve: Curves.bounceInOut,
      colorText: Color(0xFFFFFFFF),
      backgroundColor: Color(0xD2EF0E0E),
      overlayBlur: 5);}

  static showLoginVerify(){Get.snackbar('Giriş Onaylandı',
  'Keyifli vakitler dilerim.',
  backgroundColor: Color(0xB207EC3A),
  colorText: Color(0xFFFFFFFF),);}

  static showSendVerify(){Get.snackbar('Gönderim Onaylandı',
    'Keyifli vakitler dilerim.',
    backgroundColor: Color(0xB207EC3A),
    colorText: Color(0xFFFFFFFF),
      overlayBlur: 5,
    duration: Duration(seconds: 2),
  );}





}

