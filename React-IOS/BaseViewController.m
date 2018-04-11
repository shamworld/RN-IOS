//
//  BaseViewController.m
//  DeveplopFrameWorkV1.0
//
//  Created by kaiyitech on 14-10-20.
//  Copyright (c) 2014年 kaiyitech. All rights reserved.
//

#import "BaseViewController.h"
#define UICOLOR_FROM_RGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@implementation BaseViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    
    [self setNeedsStatusBarAppearanceUpdate];
    
}





//- (void) viewDidAppear:(BOOL)animated
//
//{   //黑底白字
//
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContentanimated:NO];
//    
//}


-(void)initNavigationBarNoLeftBack{
    //设置导航栏样式
    //设置导航栏样式
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [backButton setImage:[UIImage imageNamed:@"arrow123"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    if ([[[UIDevice currentDevice]systemVersion]floatValue] >= 11.0) {
        
        backButton.contentHorizontalAlignment =UIControlContentHorizontalAlignmentLeft;
        
        [backButton setImageEdgeInsets:UIEdgeInsetsMake(0, -5 *self.view.frame.size.width /375.0,0,0)];
    }
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationController.navigationBarHidden = NO;
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -15;
    self.navigationItem.leftBarButtonItems = @[spaceItem,backItem];

    
    //ios7之后设置导航栏背景
    self.navigationController.navigationBar.barTintColor = UICOLOR_FROM_RGB(0x0086d0);
    //ios7之前设置导航栏背景
    self.navigationController.navigationBar.tintColor = UICOLOR_FROM_RGB(0x0086d0);
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:17],NSFontAttributeName, nil]];
    
    
    
}

-(void)initNavigationBar{
    //设置导航栏样式
    //ios7之后设置导航栏背景
    self.navigationController.navigationBar.barTintColor = UICOLOR_FROM_RGB(0x0086d0);
    //ios7之前设置导航栏背景
    self.navigationController.navigationBar.tintColor = UICOLOR_FROM_RGB(0x0086d0);
    
    [self.navigationItem.backBarButtonItem setTitle:@""];
    [self.navigationItem setHidesBackButton:YES];
    
    //设置标题栏字体大小, 颜色
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:17],NSFontAttributeName, nil]];
    
    
    
}

#pragma mark - 事件通知
-(IBAction)backButtonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
