import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkuazmobil/resources/background_image.dart';
import 'package:turkuazmobil/resources/palette.dart';
import 'verify_logic.dart';

class VerifyPage extends StatefulWidget {
  @override
  _VerifyPageState createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  final logic = Get.find<VerifyLogic>();

  @override
    Widget build(BuildContext context) {
      return Stack(
        children: [
          BackgroundImage(),
          Scaffold(
            appBar: AppBar(
              title: Text('Anketler'),
              actions: [
                IconButton(
                    icon: Icon(
                      Icons.navigate_before,
                    ),
                    onPressed: () {
                      if (logic.search.value.page != 0) {
                        logic.search.value.page--;
                        logic.getData();
                      }else{
                        Get.snackbar('Birinci sayfadasınız', '',backgroundColor: Color(0x68001A72),snackPosition: SnackPosition.BOTTOM);
                      }
                    }),
                IconButton(
                    icon: Icon(Icons.navigate_next),
                    onPressed: () {
                      if (!(logic.myActivitySurveys.value.length <
                          logic.search.value.page)) {
                        logic.search.value.page++;
                        logic.getData();
                      }else{
                        Get.snackbar('Son sayfadasınız', '',backgroundColor: Color(0x68001A72),snackPosition: SnackPosition.BOTTOM);
                      }
                    }),
              ],
            ),
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Obx(() {
                  if(logic.loading.value){
                    return Center(child: CircularProgressIndicator());
                  }else{
                    return buildListView();
                  }
                }),
              ),
            ),
          ),
        ],
      );
    }

  @override
  void dispose() {
    Get.delete<VerifyLogic>();
    super.dispose();
  }
  ListView buildListView() {
    return ListView.builder(
        itemCount: logic.myActivitySurveys.value.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              logic.selectedSurveyIndex.value = index;
              logic.surveyId = logic.myActivitySurveys.value[logic.selectedSurveyIndex.value].id.toString();
              Get.toNamed('/VerifyImagePage',parameters: {'token':logic.token,'surveyId':logic.surveyId});
            },
            child: Card(
              color: Color(0x77000B52),
              shadowColor: Colors.grey,
              elevation: 100000,
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.32,
                      child: buildImage(logic.myActivitySurveys.value[index].survey),
                    ),
                    Flexible(
                      child: Padding(
                        padding:
                        const EdgeInsets.only(left: 20, top: 5),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              logic.myActivitySurveys.value[index].survey.title,
                              style: kBodyText,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              logic.myActivitySurveys.value[index].survey.body,
                              style: kSubBodyText,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              logic.myActivitySurveys.value[index].survey.creationAt.month
                                  .toString() +
                                  '.' +
                                  logic.myActivitySurveys.value[index].survey.creationAt.day
                                      .toString() +
                                  '.' +
                                  logic.myActivitySurveys.value[index].survey.creationAt.year
                                      .toString() +
                                  ' ' +
                                  logic.myActivitySurveys.value[index].survey.creationAt.hour
                                      .toString() +
                                  ':' +
                                  logic.myActivitySurveys.value[index].survey.creationAt
                                      .minute
                                      .toString(),
                              overflow: TextOverflow.ellipsis,
                              style: kSubBodyText,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Image buildImage(survey) {
    if (survey == null) {
      return Image.asset('assets/images/not-found.png');
    }

    if (survey.smallImages == null || survey.smallImages.length == 0) {
      return Image.asset('assets/images/not-found.png');
    }

    var filePath = survey?.smallImages[0].fileName;

    if (filePath == null || '' == filePath) {
      return Image.asset('assets/images/not-found.png');
    }

    return Image.network(
        filePath.replaceAll(r"\", '/'),
        fit: BoxFit.fill,
        errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {

          return Image.asset('assets/images/not-found.png');}
    );
  }



}