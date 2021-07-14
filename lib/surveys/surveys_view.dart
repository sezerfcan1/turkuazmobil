import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkuazmobil/models/search/search.dart' as search;
import 'package:turkuazmobil/resources/background_image.dart';
import 'package:turkuazmobil/resources/palette.dart';

import 'surveys_logic.dart';

class SurveysPage extends StatefulWidget {
  @override
  _SurveysPageState createState() => _SurveysPageState();
}

class _SurveysPageState extends State<SurveysPage> {
  final logic = Get.find<SurveysLogic>();
  var textController = TextEditingController();
  DateTimeRange dateRange;
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
                    if (logic.search.value.pagination.page != 0) {
                      logic.search.value.pagination.page--;
                      logic.getData();
                    }else{
                      Get.snackbar('İlk sayfadasınız', 'Daha fazla geri gidemezsiniz',snackPosition: SnackPosition.TOP,duration: Duration(milliseconds: 750));

                    }
                  }),
              IconButton(
                  icon: Icon(Icons.navigate_next),
                  onPressed: () {
                    if (!(logic.surveysMini.length <
                        logic.search.value.pagination.rows)) {
                      logic.search.value.pagination.page++;
                      logic.getData();
                    }else{
                      Get.snackbar('Son sayfadasınız', 'Daha fazla ileri gidemezsiniz',snackPosition: SnackPosition.TOP,duration: Duration(milliseconds: 750));
                    }
                  }),
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: AlertDialog(
                              backgroundColor: Color(0x880A0DBA),
                              title: Text(
                                'İsime Göre Arama',
                                style: kBodyText,
                              ),
                              content: TextField(
                                controller: textController,
                                decoration: InputDecoration(
                                  labelStyle: kSubBodyText,
                                  fillColor: Colors.grey,
                                  filled: true,
                                ),
                                style: kBodyText,
                              ),
                              actions: [
                                IconButton(
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      textController.text = '';
                                      Get.back();
                                    }),
                                IconButton(
                                    icon:
                                    Icon(Icons.search, color: Colors.white),
                                    onPressed: () async {
                                      var filter = search.Filter(title: textController.text);
                                      logic.search.value.filter = filter;
                                      filter.min = DateTime(1996,13,5);
                                      filter.max = DateTime.now();
                                      filter.choiceGroupId = 0;
                                      logic.getData();
                                      textController.text = '';
                                      Get.back();

                                    }),
                              ],
                            ),
                          );
                        });
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
        itemCount: logic.surveysMini.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              logic.selectedSurveyIndex.value = index;
              logic.surveyId = logic.surveysMini[logic.selectedSurveyIndex.value].id.toString();
              Get.toNamed('/ImagesPage',parameters: {'token':logic.token,'surveyId':logic.surveyId});
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
                      child: buildImage(logic.surveysMini[index]),
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
                              logic.surveysMini[index].title,
                              style: kBodyText,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              logic.surveysMini[index].choiceGroup.name,
                              style: kSubBodyText,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              logic.surveysMini[index].creationAt.month
                                  .toString() +
                                  '.' +
                                  logic.surveysMini[index].creationAt.day
                                      .toString() +
                                  '.' +
                                  logic.surveysMini[index].creationAt.year
                                      .toString() +
                                  ' ' +
                                  logic.surveysMini[index].creationAt.hour
                                      .toString() +
                                  ':' +
                                  logic.surveysMini[index].creationAt
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

  @override
  void dispose() {
    Get.delete<SurveysLogic>();
    super.dispose();
  }

  Image buildImage(survey) {
    try{
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
    }catch (_){
      return Image.asset('assets/images/not-found.png');
    }
  }

}