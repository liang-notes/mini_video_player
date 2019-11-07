import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


typedef void MiniVideoPlayerCreatedCallBack(MiniVideoPlayerController controller);

class MiniVideoPlayerController {
  MethodChannel _channel;

  MiniVideoPlayerController.init(int id) {
    _channel = new MethodChannel('mini_video_player_$id');
  }

  Future<void> loadUrl(String url) async {
    assert(url != null);
    return _channel.invokeMethod('loadUrl', url);
  }

  Future<void> resume() async {
    return _channel.invokeMethod('resume');
  }

  Future<void> pause() async {
    return _channel.invokeMethod('pause');
  }

  Future<void> dealloc() async {
    return _channel.invokeMethod('dealloc');
  }

}

class MiniVideoPlayer extends StatefulWidget {

  final MiniVideoPlayerCreatedCallBack onCreated;
  final x;
  final y;
  final width;
  final height;

  MiniVideoPlayer(
      {Key key,
        @required this.onCreated,
        @required this.x,
        @required this.y,
        @required this.width,
        @required this.height});

  @override
  _MiniVideoPlayerState createState() => _MiniVideoPlayerState();

}

class _MiniVideoPlayerState extends State<MiniVideoPlayer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: nativeView(),
      onHorizontalDragStart: (DragStartDetails details) {},
      onHorizontalDragUpdate: (DragUpdateDetails details) {},
      onHorizontalDragEnd: (DragEndDetails details) {},
      onTapDown: (TapDownDetails details) {},
    );
  }

  nativeView() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'plugins.mini_video_player/view',
        onPlatformViewCreated: onPlatformViewCreated,
        creationParams: <String, dynamic>{
          'x': widget.x,
          'y': widget.y,
          'width': widget.width,
          'height': widget.height
        },
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else {
      return UiKitView(
        viewType: 'plugins.mini_video_player/view',
        onPlatformViewCreated: onPlatformViewCreated,
        creationParams: <String, dynamic>{
          'x': widget.x,
          'y': widget.y,
          'width': widget.width,
          'height': widget.height
        },
        creationParamsCodec: const StandardMessageCodec(),
      );
    }
  }

  Future<void> onPlatformViewCreated(id) async {
    if (widget.onCreated != null) {
      widget.onCreated(new MiniVideoPlayerController.init(id));
    }
  }

}