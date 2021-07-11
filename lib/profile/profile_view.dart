import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:turkuazmobil/resources/background_image.dart';
import 'package:turkuazmobil/resources/palette.dart';

import 'profile_logic.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final logic = Get.find<ProfileLogic>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(),
        Obx(() {
          if(logic.loading){
            return Center(child: CircularProgressIndicator(),);
          }else{
            return ProfileBuilder(size: size, logic: logic);
          }
        })
      ],
    );
  }

  @override
  void dispose() {
    Get.delete<ProfileLogic>();
    super.dispose();
  }
}

class ProfileBuilder extends StatelessWidget {
  const ProfileBuilder({
    Key key,
    @required this.size,
    @required this.logic,
  }) : super(key: key);

  final Size size;
  final ProfileLogic logic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        children: <Widget>[
          new Column(
            children: <Widget>[
              SizedBox(
                height: size.height * 0.1,
              ),
              Container(
                height: 190.0,
                width: 190.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(logic.myInfo.value.image.fileName
                          .replaceAll(r"\", '/')),
                    ),
                    border: Border.all(color: Colors.white, width: 2.0)),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      logic.myInfo.value.fullName == null
                          ? 'Girilmedi'
                          : logic.myInfo.value.fullName,
                      style: kSubHeadText,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Container(
                  child: Text(
                      logic.myInfo.value.department == null
                          ? 'Girilmedi'
                          : logic.myInfo.value.department,
                      style: kBodyText)),
              SizedBox(
                height: size.height * 0.030,
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.apartment,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          logic.myInfo.value.hospital == null
                              ? 'Girilmedi'
                              : logic.myInfo.value.hospital,
                          style: kBodyText,
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.work,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          logic.myInfo.value.title == null
                              ? 'Girilmedi'
                              : logic.myInfo.value.title,
                          style: kBodyText,
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          FontAwesomeIcons.venusMars,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          logic.myInfo.value.gender == null
                              ? 'Girilmedi'
                              : logic.myInfo.value.gender == '1'
                                  ? 'Erkek'
                                  : 'Kadın',
                          style: kBodyText,
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          logic.myInfo.value.phone == null
                              ? 'Girilmedi'
                              : logic.myInfo.value.phone,
                          style: kBodyText,
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          logic.myInfo.value.email == null
                              ? 'Girilmedi'
                              : logic.myInfo.value.email,
                          style: kBodyText,
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
                    ElevatedButton(
                      child: Text('Bilgilerimi Güncelle'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage()));
                      },
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
