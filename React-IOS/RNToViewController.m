//
//  RNToViewController.m
//  React-IOS
//
//  Created by ios on 2018/3/19.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "RNToViewController.h"
#import <React/RCTRootView.h>
@interface RNToViewController ()

@end

@implementation RNToViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigationBarNoLeftBack];
    NSURL *jsCodeLocation = [NSURL
                             URLWithString:@"http://localhost:8081/Detail.bundle?platform=ios"];
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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
