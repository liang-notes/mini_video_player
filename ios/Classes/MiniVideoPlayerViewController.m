//
//  MiniVideoPlayerViewController.m
//  mini_video_player
//
//  Created by Wang Liang, (Liang.SL.Wang@partner.bmw.com) on 2019/10/14.
//

#import "MiniVideoPlayerViewController.h"
#import <JPVideoPlayer/JPVideoPlayerKit.h>

@interface MiniVideoPlayerViewController ()<JPVideoPlayerDelegate>

@end

@implementation MiniVideoPlayerViewController {
    UIView * _videoView;
    int64_t _viewId;
    FlutterMethodChannel* _channel;
}


- (instancetype)initWithWithFrame:(CGRect)frame
                   viewIdentifier:(int64_t)viewId
                        arguments:(id _Nullable)args
                  binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger {
    if ([super init]) {
        _viewId = viewId;
        _videoView = [UIView new];
        _videoView.backgroundColor = [UIColor blackColor];
        NSDictionary *dic = args;
        CGFloat x = [dic[@"x"] floatValue];
        CGFloat y = [dic[@"y"] floatValue];
        CGFloat width = [dic[@"width"] floatValue];
        CGFloat height = [dic[@"height"] floatValue];
        _videoView.frame = CGRectMake(x, y, width, height);
        _videoView.jp_videoPlayerDelegate = self;
        NSString* channelName = [NSString stringWithFormat:@"mini_video_player_%lld", viewId];
        _channel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:messenger];
        __weak __typeof__(self) weakSelf = self;
        [_channel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
            [weakSelf onMethodCall:call result:result];
        }];
    }
    return self;
}

- (nonnull UIView *)view {
    return _videoView;
}

- (void)onMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([[call method] isEqualToString:@"loadUrl"]) {
        [self onLoadUrl:call result:result];
    }
    else if ([[call method] isEqualToString:@"resume"]) {
        [_videoView jp_resume];
        result(nil);
    }
    else if ([[call method] isEqualToString:@"pause"]) {
        [_videoView jp_pause];
        result(nil);
    }
    else if ([[call method] isEqualToString:@"dealloc"]) {
        [_videoView jp_stopPlay];
        result(nil);
    }
    else {
        result(FlutterMethodNotImplemented);
    }
}

- (void)onLoadUrl:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSString* url = [call arguments];
    if (![self loadUrl:url]) {
        result([FlutterError errorWithCode:@"loadUrl_failed"
                                   message:@"Failed parsing the URL"
                                   details:[NSString stringWithFormat:@"URL was: '%@'", url]]);
    } else {
        result(nil);
    }
}

- (bool)loadUrl:(NSString*)url {
    NSURL* nsUrl = [NSURL URLWithString:url];
    if (!nsUrl) {
        return false;
    }
    
    [_videoView jp_playVideoWithURL:nsUrl
                 bufferingIndicator:nil
                        controlView:nil
                       progressView:nil
                      configuration:^(UIView *view, JPVideoPlayerModel *playerModel) {
                          // self.muteSwitch.on = ![self.videoContainer jp_muted];
                      }];
    return true;
}

#pragma mark - JPVideoPlayerDelegate

- (BOOL)shouldAutoReplayForURL:(nonnull NSURL *)videoURL {
    return true;
}


@end
