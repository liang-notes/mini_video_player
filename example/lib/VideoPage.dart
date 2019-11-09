import 'package:flutter/material.dart';
import 'package:mini_video_player/mini_video_player.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {

  MiniVideoPlayerController viewPlayerController;

  void onViewPlayerCreated(viewPlayerController) {
    this.viewPlayerController = viewPlayerController;
    this.viewPlayerController.loadUrl(
        "http://xianshi.img-cn-shanghai.aliyuncs.com/bachelordom/1558858006627.mp4");
  }

  @override
  void dispose() {
    super.dispose();
    viewPlayerController.dealloc();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height-200;

    MiniVideoPlayer videoPlayer = new MiniVideoPlayer(
        onCreated: onViewPlayerCreated,
        hiddenControlView: true,
        width: width,
        height: height);

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: videoPlayer,
            width: width,
            height: height,
          ),
          Wrap(
            children: <Widget>[
              FlatButton(
                child: Text('暂停'),
                onPressed: (){
                  viewPlayerController.pause();
                },
              ),
              FlatButton(
                child: Text('恢复'),
                onPressed: (){
                  viewPlayerController.resume();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
