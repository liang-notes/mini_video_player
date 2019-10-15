
import 'package:flutter/material.dart';
import 'package:mini_video_player/mini_video_player.dart';

class VideoPage extends StatelessWidget {

  MiniVideoPlayerController viewPlayerController;

  void onViewPlayerCreated(viewPlayerController) {
    this.viewPlayerController = viewPlayerController;
    this.viewPlayerController.loadUrl("http://xianshi.img-cn-shanghai.aliyuncs.com/bachelordom/1558858006627.mp4");
  }

  @override
  Widget build(BuildContext context) {

    var x = 0.0;
    var y = 0.0;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    MiniVideoPlayer videoPlayer = new MiniVideoPlayer(
        onCreated: onViewPlayerCreated,
        x: x,
        y: y,
        width: width,
        height: height
    );

    return Scaffold(
      body: Container(
        child: videoPlayer,
        width: width,
        height: height,
      ),
    );
  }
}
