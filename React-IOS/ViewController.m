//
//  ViewController.m
//  React-IOS
//
//  Created by ios on 2018/3/14.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "ViewController.h"
#import "ScoreViewController.h"
#import <React/RCTRootView.h>
#import "RNToViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title=@"包含RN的原生页面";
    NSURL *jsCodeLocation = [NSURL
                             URLWithString:@"http://localhost:8081/index.bundle?platform=ios"];
    RCTRootView *rootView =
    [[RCTRootView alloc] initWithBundleURL : jsCodeLocation
                         moduleName        : @"ReactIOS"
                         initialProperties :
     @{
       @"scores" : @[
               @{
                   @"name" : @"Alex",
                   @"value": @"42"
                   },
               @{
                   @"name" : @"Joel",
                   @"value": @"10"
                   }
               ]
       }
                          launchOptions    : nil];
    self.view = rootView;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doPushNotification:) name:@"RNOpenOneVC" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(scoreNotification:) name:@"ToScoreVC" object:nil];
}
- (void)doPushNotification:(NSNotification *)notification{
    NSLog(@"成功收到===>通知");
    NSDictionary *dic=notification.userInfo;
    RNToViewController *vc = [[RNToViewController alloc]init];
    vc.title=dic[@"msg"];
    [self.navigationController pushViewController:vc animated:YES];
    
    //注意不能在这里移除通知否则pus进去后有pop失效
}

- (void)scoreNotification:(NSNotification *)notification{
    ;
    NSDictionary *dic=notification.userInfo;
    NSLog(@"成功收到===>通知-------%@",dic);
    ScoreViewController *vc = [[ScoreViewController alloc]init];
    vc.strings=dic[@"title"];
    [self.navigationController pushViewController:vc animated:YES];
    
    //注意不能在这里移除通知否则pus进去后有pop失效
}



//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    ScoreViewController *vc = [[ScoreViewController alloc] init];
//
//    [self presentViewController:vc animated:YES completion:nil];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
