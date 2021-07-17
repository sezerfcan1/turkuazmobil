import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:turkuazmobil/resources/background_image.dart';
import 'package:turkuazmobil/resources/palette.dart';
import 'video_call_logic.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
const appId = '932d20bdf6cb4a23a07decbc1dbf3631';
const token = '006932d20bdf6cb4a23a07decbc1dbf3631IAA8xu2a/wI1pT0ZvWV5fsaxJ3BKFr+J3GrToH9XvcwfmcZ+SWEAAAAAEAAApPzoOL/yYAEAAQA4v/Jg';

class VideoCallPage extends StatefulWidget {
  @override
  _VideoCallPageState createState() => _VideoCallPageState();
}

class _VideoCallPageState extends State<VideoCallPage> {
  final logic = Get.find<VideoCallLogic>();

  @override
    Widget build(BuildContext context) {
      return Stack(
        children: [
          BackgroundImage(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: InkWell(
                onTap: (){
                  Get.to(VideoCallWidget());
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
                        child: Center(child: Text('Arama Başlat',style: Theme.of(context).textTheme.button.apply(color: Colors.black),)),
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
                        Icons.video_call,
                        size: 30.0,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ),
        ],
      );
    }

  @override
  void dispose() {
    Get.delete<VideoCallLogic>();
    super.dispose();
  }
}


class VideoCallWidget extends StatefulWidget {
  @override
  _VideoCallWidgetState createState() => _VideoCallWidgetState();
}

class _VideoCallWidgetState extends State<VideoCallWidget> {
  int _remoteUid;
  RtcEngine _engine;

  @override
  void initState() {
    super.initState();
    initForAgora();
  }

  @override
  void dispose(){
    _engine.leaveChannel();
    _engine.destroy();
    super.dispose();
  }

  Future<void> closeCall(){
    _engine.muteAllRemoteVideoStreams(true);
  }

  Future<void> initForAgora() async {

    await [Permission.camera].request();

    _engine = await RtcEngine.createWithConfig(RtcEngineConfig(appId));

    await _engine.enableVideo();

    _engine.setEventHandler(
      RtcEngineEventHandler(

        userJoined: (int uid, int elapsed) {
          setState(() {
            _remoteUid = uid;
          });
        },
        userOffline: (int uid, UserOfflineReason reason) {
          setState(() async {
            _remoteUid = null;
          });
        },
      ),
    );

    await _engine.joinChannel(token, "secondChannel", null, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Görüntülü Arama'),
      ),
      body: Center(
        child: _renderLocalPreview(),
      ),
    );
  }

  Widget _renderLocalPreview() {
    return RtcLocalView.SurfaceView();
  }
}