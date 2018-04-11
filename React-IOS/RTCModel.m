//
//  RTCModel.m
//  React-IOS
//
//  Created by ios on 2018/3/19.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "RTCModel.h"
#import <React/RCTBridge.h>

@implementation RTCModel

@synthesize bridge = _bridge;

//导出模块 不添加参数即默认认为这个oc类的名字
RCT_EXPORT_MODULE(RTCModel)
//导出方法，桥接到js的方法返回值类型必须是void

- (NSArray<NSString *> *)supportedEvents {
    return @[@"EventReminder"]; //这里返回的将是你要发送的消息名的数组。
}
/*
 
 iOS支持方法名一样但是参数不一样的方法，视为两个不同的方法
 但是RN调用iOS这样的方法会出错的
 所以最好别把方法名声明成一样的
 
 */

/**************************************** RN Call iOS ***************************************************/
//rn跳转原生界面
RCT_EXPORT_METHOD(RNOpenOneVC:(NSString *)msg){
    NSLog(@"RN传入原生界面的数据为:%@",msg);
    NSDictionary *dic=@{@"msg":msg};
    //主要这里必须使用主线程发送，不然有可能失效
    dispatch_sync(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"RNOpenOneVC" object:nil userInfo:dic];
    });
}

RCT_EXPORT_METHOD(ToScoreVC:(NSString *)msg){
    NSLog(@"RN传入原生界面的数据为:%@",msg);
    NSDictionary *dic=@{@"title":msg};
    //主要这里必须使用主线程发送，不然有可能失效
    dispatch_sync(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ToScoreVC" object:nil userInfo:dic];
    });
}
/**************************************** ios 传数据给 rn ***************************************************/


- (void)startObserving
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(emitEventInternal:)
                                                 name:@"event-emitted"
                                               object:nil];
}
- (void)stopObserving
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)emitEventInternal:(NSNotification *)notification
{
    [self sendEventWithName:@"EventReminder"
                       body:notification.userInfo];
}



+ (void)emitEventWithName:(NSString *)name andPayload:(NSDictionary *)payload
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"event-emitted"
                                                        object:self
                                                      userInfo:payload];
    
}


@end
