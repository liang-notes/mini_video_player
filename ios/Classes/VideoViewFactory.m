//
//  VideoViewFactory.m
//  mini_video_player
//
//  Created by Wang Liang, (Liang.SL.Wang@partner.bmw.com) on 2019/10/14.
//

#import "VideoViewFactory.h"
#import "MiniVideoPlayerViewController.h"

@implementation VideoViewFactory{
    NSObject<FlutterBinaryMessenger>* _messenger;
}

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messenger {
    self = [super init];
    if (self) {
        _messenger = messenger;
    }
    return self;
}

- (NSObject<FlutterMessageCodec>*)createArgsCodec {
    return [FlutterStandardMessageCodec sharedInstance];
}

- (nonnull NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame
                                            viewIdentifier:(int64_t)viewId
                                                 arguments:(id _Nullable)args {
    
    MiniVideoPlayerViewController* viewController = [[MiniVideoPlayerViewController alloc] initWithWithFrame:frame viewIdentifier:viewId arguments:args binaryMessenger:_messenger];
    return viewController;
}

@end
