# mini_video_player

A new mini video player Flutter plugin for Android and iOS.
it can customize the player display size (full screen or fixed size).

## Getting Started

### Configure info.plist
** add key to info.plist
```
io.flutter.embedded_views_preview = Yes
```
** if use http you need add
```
Allow Arbitrary Loads = Yes
```

### For example
```
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
        hiddenControlView: false,
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
                child: Text('pause'),
                onPressed: (){
                  viewPlayerController.pause();
                },
              ),
              FlatButton(
                child: Text('resume'),
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
```


