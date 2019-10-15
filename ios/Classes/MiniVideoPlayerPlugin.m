#import "MiniVideoPlayerPlugin.h"
#import "VideoViewFactory.h"

@implementation MiniVideoPlayerPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
//  FlutterMethodChannel* channel = [FlutterMethodChannel
//      methodChannelWithName:@"mini_video_player"
//            binaryMessenger:[registrar messenger]];
//  MiniVideoPlayerPlugin* instance = [[MiniVideoPlayerPlugin alloc] init];
//  [registrar addMethodCallDelegate:instance channel:channel];
    
    VideoViewFactory *factory =
    [[VideoViewFactory alloc] initWithMessenger:registrar.messenger];
    [registrar registerViewFactory:factory withId:@"plugins.mini_video_player/view"];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
    
}

@end
