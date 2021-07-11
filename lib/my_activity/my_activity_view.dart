import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkuazmobil/resources/background_image.dart';
import 'package:turkuazmobil/resources/palette.dart';

import 'my_activity_logic.dart';

class MyActivityPage extends StatefulWidget {
  @override
  _MyActivityPageState createState() => _MyActivityPageState();
}

class _MyActivityPageState extends State<MyActivityPage> {
  final logic = Get.find<MyActivityLogic>();

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
                      if (!(logic.myActivitySurveys.length <
                          logic.search.value.rows)) {
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
                  if(logic.loading){
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

  ListView buildListView() {
    return ListView.builder(
        itemCount: logic.myActivitySurveys.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
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
                    child: buildImage(logic.myActivitySurveys[index].survey),
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
                            logic.myActivitySurveys[index].survey.title,
                            style: kBodyText,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            logic.myActivitySurveys[index].survey.body ?? '',
                            style: kSubBodyText,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            logic.myActivitySurveys[index].creationAt.month
                                .toString() +
                                '.' +
                                logic.myActivitySurveys[index].creationAt.day
                                    .toString() +
                                '.' +
                                logic.myActivitySurveys[index].creationAt.year
                                    .toString() +
                                ' ' +
                                logic.myActivitySurveys[index].creationAt.hour
                                    .toString() +
                                ':' +
                                logic.myActivitySurveys[index].creationAt
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
    return Image.network(filePath.replaceAll(r"\", '/'));
  }

  @override
  void dispose() {
    Get.delete<MyActivityLogic>();
    super.dispose();
  }
}