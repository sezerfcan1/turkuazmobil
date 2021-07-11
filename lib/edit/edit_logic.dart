import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:turkuazmobil/api_client/answer_send_api_client.dart';
import 'package:turkuazmobil/images/images_logic.dart';
import 'package:turkuazmobil/models/search/surveys.dart';
import 'package:turkuazmobil/models/survey/answer.dart' as ans;

class EditLogic extends GetxController {

  var selectedChoiceId = 0.obs;
  var bottomNavigationBarSelectedItem = 0.obs;
  DateTime creationAt = DateTime.now();
  var choices = <Choice>[].obs;
  var zoomable = false.obs;
  var color = Color(0x00000000).obs;



  String token = Get.parameters['token'];

  sendAnswers(ImagesLogic imagesLogic){
    try{
      Get.snackbar('Bağlantı kuruluyor', 'Yaptığınız yorumlar sunucuya gönderiliyor',snackPosition: SnackPosition.BOTTOM,duration: Duration(milliseconds: 5000),showProgressIndicator: true);
      ans.Answer answer = ans.Answer();
      answer.surveyId = int.parse(imagesLogic.surveyId);
      answer.choices = <ans.Choice>[];
      for(int imageIndex = 0 ; imageIndex < imagesLogic.survey.value.images.length ; imageIndex++){
        answer.choices.add(
            ans.Choice(surveyImageId: imagesLogic.survey.value.images[imageIndex].id,boxes: imagesLogic.survey.value.images[imageIndex].cp.getBoxes() )
        );
      }
      answer.creationAt = DateTime.now();
      SendSurveyApiClient sendSurveyApiClient = SendSurveyApiClient(httpClient: http.Client());
      sendSurveyApiClient.sendAnswer(token, answer);
    }catch(_){
      Get.snackbar('Bağlantı hatası', 'Üzügünüm sunucuya bağlanırken bir problemle karşılaştık',snackPosition: SnackPosition.BOTTOM,duration: Duration(milliseconds: 5000),showProgressIndicator: true,backgroundColor: Color(
          0x9ACD0000),colorText: Color(0xFFFFFFFF));
    }finally{
      Get.snackbar('Değerli yorumlarınız teşekkürler.', 'Diğer anketlere katılmak için anketler sayfasına gidebilirsiniz.',snackPosition: SnackPosition.BOTTOM,duration: Duration(milliseconds: 3000),backgroundColor: Color(
          0x9014DE00),colorText: Color(0xFFFFFFFF));
    }

  }




}
