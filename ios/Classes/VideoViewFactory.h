//
//  VideoViewFactory.h
//  mini_video_player
//
//  Created by Wang Liang, (Liang.SL.Wang@partner.bmw.com) on 2019/10/14.
//

#import <Foundation/Foundation.h>
#import "MiniVideoPlayerPlugin.h"

NS_ASSUME_NONNULL_BEGIN

@interface VideoViewFactory : NSObject<FlutterPlatformViewFactory>

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;

@end

NS_ASSUME_NONNULL_END
