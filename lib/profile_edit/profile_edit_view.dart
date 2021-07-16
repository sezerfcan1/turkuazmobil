import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:turkuazmobil/profile/profile_logic.dart';
import 'package:turkuazmobil/resources/background_image.dart';
import 'package:turkuazmobil/resources/palette.dart';
import 'package:turkuazmobil/resources/text_input.dart';
import 'profile_edit_logic.dart';

class ProfileEditPage extends StatefulWidget {
  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final logic = Get.find<ProfileEditLogic>();
  final profileLogic = Get.find<ProfileLogic>();



  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    logic.email.value.text = profileLogic.myInfo.value.email;
    logic.name.value.text = profileLogic.myInfo.value.name;
    logic.surname.value.text = profileLogic.myInfo.value.surname;
    logic.phone.value.text = profileLogic.myInfo.value.phone;
    logic.about.value.text = profileLogic.myInfo.value.about;
    logic.hospital.value.text = profileLogic.myInfo.value.hospital;
    logic.department.value.text = profileLogic.myInfo.value.department;
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              child: ListView(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Obx(() {
                      return Stack(
                        children: [
                          CircleAvatar(
                            radius: 100.0,
                            backgroundImage: profileLogic.myInfo.value.image !=null
                                ? NetworkImage(profileLogic.myInfo.value.image.fileName .replaceAll(r"\", '/'))
                                : AssetImage('assets/images/profile.jpg')
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  side: BorderSide(color: Colors.white),
                                ),
                                color: Colors.grey[200],
                                onPressed: () {
                                  Get.bottomSheet(
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(16.0),
                                            topRight: Radius.circular(16.0)),
                                      ),
                                      child: Wrap(
                                        alignment: WrapAlignment.end,
                                        crossAxisAlignment: WrapCrossAlignment.end,
                                        children: [
                                          ListTile(
                                            leading: Icon(Icons.camera),
                                            title: Text('Kamera'),
                                            onTap: () async {
                                              Get.back();
                                              logic.changeProfileImage(ImageSource.camera);
                                            },
                                          ),
                                          ListTile(
                                            leading: Icon(Icons.image),
                                            title: Text('Galeri'),
                                            onTap: () async {
                                              Get.back();
                                              logic.changeProfileImage(ImageSource.gallery);
                                              },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }, child: Icon(Icons.camera_alt),

                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextInput(
                    icon: FontAwesomeIcons.mailBulk,
                    hint: 'E-Mail',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                    inputString: logic.email.value,
                  ),
                  TextInput(
                    icon: FontAwesomeIcons.user,
                    hint: 'İsim',
                    inputType: TextInputType.name,
                    inputAction: TextInputAction.next,
                    inputString: logic.name.value,
                  ),
                  TextInput(
                    icon: FontAwesomeIcons.user,
                    hint: 'Soyisim',
                    inputType: TextInputType.name,
                    inputAction: TextInputAction.next,
                    inputString: logic.surname.value,
                  ),
                  TextInput(
                    icon: FontAwesomeIcons.phone,
                    hint: 'Telefon Numarası',
                    inputType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    inputString: logic.phone.value,
                  ),
                  TextInput(
                    icon: FontAwesomeIcons.hospital,
                    hint: 'Hastane',
                    inputType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    inputString: logic.hospital.value,
                  ),
                  TextInput(
                    icon: Icons.work,
                    hint: 'Departman',
                    inputType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    inputString: logic.department.value,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: color2,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: DropdownButton<String>(
                        dropdownColor: color2,
                        style: kBodyText,
                        icon: Icon(FontAwesomeIcons.mars),
                        items: <String>['Erkek', 'Kadın'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value == 'Erkek') {
                            logic.gender.value = 0;
                          } else {
                            logic.gender.value = 1;
                          }
                        },
                      ),
                    ),
                  ),
                  TextInput(
                    icon: Icons.info_outline,
                    hint: 'Hakkımda',
                    inputType: TextInputType.multiline,
                    inputAction: TextInputAction.next,
                    inputString: logic.about.value,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.context.width * 0.15),
                    child: InkWell(
                      onTap: () {
                        logic.profileInfo.value.name = logic.name.value.text;
                        logic.profileInfo.value.hospital =
                            logic.hospital.value.text;
                        logic.profileInfo.value.phone = logic.phone.value.text;
                        logic.profileInfo.value.surname =
                            logic.surname.value.text;
                        logic.profileInfo.value.department =
                            logic.department.value.text;
                        logic.profileInfo.value.email = logic.email.value.text;
                        logic.profileInfo.value.about = logic.about.value.text;
                        logic.profileInfo.value.isConfirmed = true;
                        logic.profileInfo.value.gender = logic.gender.value;
                        logic.sendData();
                      },
                      child: Container(
                        height: 50,
                        width: Get.context.width * 0.56,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0.0, 20.0),
                              blurRadius: 30.0,
                              color: Colors.black12,
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: Get.context.width * 0.4,
                              height: double.infinity,
                              child: Center(
                                  child: Text(
                                'Bilgilerimi Güncelle',
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    .apply(color: Colors.black),
                              )),
                              decoration: BoxDecoration(
                                  color: color3,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(80.0),
                                    topLeft: Radius.circular(80.0),
                                    bottomRight: Radius.circular(200.0),
                                  )),
                            ),
                            SizedBox(
                              width: Get.context.width * 0.05,
                            ),
                            Icon(
                              Icons.home,
                              size: 30.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextInputObs(
                      hint: 'Mevcut',
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      inputString: logic.currentPassword.value),
                  TextInputObs(
                      hint: 'Yeni',
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      inputString: logic.newPassword.value),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.context.width * 0.15),
                    child: InkWell(
                      onTap: () {
                        logic.modifyPassword.value.current =
                            logic.currentPassword.value.text;
                        logic.modifyPassword.value.change =
                            logic.newPassword.value.text;

                        logic.changePassword();
                      },
                      child: Container(
                        height: 50,
                        width: Get.context.width * 0.56,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0.0, 20.0),
                              blurRadius: 30.0,
                              color: Colors.black12,
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: Get.context.width * 0.4,
                              height: double.infinity,
                              child: Center(
                                  child: Text(
                                'Şifremi Değiştir',
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    .apply(color: Colors.black),
                              )),
                              decoration: BoxDecoration(
                                  color: color3,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(80.0),
                                    topLeft: Radius.circular(80.0),
                                    bottomRight: Radius.circular(200.0),
                                  )),
                            ),
                            SizedBox(
                              width: Get.context.width * 0.05,
                            ),
                            Icon(
                              Icons.home,
                              size: 30.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    Get.delete<ProfileEditLogic>();
    super.dispose();
  }
}
