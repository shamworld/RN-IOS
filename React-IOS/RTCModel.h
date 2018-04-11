//
//  RTCModel.h
//  React-IOS
//
//  Created by ios on 2018/3/19.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <React/RCTEventEmitter.h>
#import <React/RCTBridgeModule.h>

@interface RTCModel : RCTEventEmitter<RCTBridgeModule>
+ (void)emitEventWithName:(NSString *)name andPayload:(NSDictionary *)payload;//iOS给RN发送数据
@end
