//
//  MiniVideoPlayerViewController.h
//  mini_video_player
//
//  Created by Wang Liang, (Liang.SL.Wang@partner.bmw.com) on 2019/10/14.
//

#import <UIKit/UIKit.h>
#import "MiniVideoPlayerPlugin.h"

NS_ASSUME_NONNULL_BEGIN

@interface MiniVideoPlayerViewController : NSObject<FlutterPlatformView>

- (instancetype)initWithWithFrame:(CGRect)frame
                   viewIdentifier:(int64_t)viewId
                        arguments:(id _Nullable)args
                  binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;

@end

NS_ASSUME_NONNULL_END
