import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:turkuazmobil/api_client/profile_edit_api_client.dart';
import 'package:turkuazmobil/models/login/modify_password.dart';
import 'package:turkuazmobil/models/login/profile_edit.dart';
import 'package:turkuazmobil/resources/constant.dart';
import 'package:turkuazmobil/resources/exception.dart';

class ProfileEditLogic extends GetxController {
  ProfileEditLogic({@required this.profileEditApiClient});

  ProfileEditApiClient profileEditApiClient;
  var profileLogic;
  var loading = false.obs;
  var isloading = false.obs;
  var error = true.obs;
  var token = Get.parameters['token'];
  var profileInfo = ProfileInfo().obs;
  final email = TextEditingController().obs;
  final gender = 0.obs;
  final name = TextEditingController().obs;
  final surname = TextEditingController().obs;
  final jobD = TextEditingController().obs;
  final phone = TextEditingController().obs;
  final hospital = TextEditingController().obs;
  final department = TextEditingController().obs;
  final about = TextEditingController().obs;
  final newPassword = TextEditingController().obs;
  final currentPassword = TextEditingController().obs;
  final modifyPassword = ModifyPassword().obs;
  var picker = ImagePicker().obs;
  var data = PickedFile('').obs;

  sendData() async {
    loading(true);
    try {
      error.value =
      await profileEditApiClient.sendProfileEdit(profileInfo.value, token);
      if (!error.value) {
        Get.back();
        Constant.showSendVerify();
      }
    } on SocketException {
      Constant.showConnectError();
    } on BadRequest {
      Constant.showBadRequest();
    } catch (_) {
      Constant.unexpectedError();
    } finally {
      loading(false);
    }
  }

  changePassword() async {
    loading(true);
    try {
      error.value =
      await profileEditApiClient.changePassword(modifyPassword.value, token);
      if (!error.value) {
        Get.back();
        Constant.showSendVerify();
      }
    } on SocketException {
      Constant.showConnectError();
    } on BadRequest {
      Constant.showBadRequest();
    } catch (_) {
      Constant.unexpectedError();
    } finally {
      loading(false);
    }
  }

  changeProfileImage(ImageSource imageSource) async {
    try {
      data.value = await ImagePicker().getImage(source: imageSource);
      isloading(true);
      if (data.value != null) {
        await profileEditApiClient.changeImage(data.value.path, token);
        Get.back();
        Constant.showSendVerify();
      }
    } on SocketException {
      Constant.showConnectError();
    } on BadRequest {
      Constant.showBadRequest();
    } catch (_) {
      Constant.unexpectedError();
    } finally {
      loading(false);
    }
  }



}

