//
//  ScoreViewController.m
//  TestReactNative
//
//  Created by msy on 17/3/15.
//  Copyright © 2017年 ZhouZ. All rights reserved.
//

#import "ScoreViewController.h"
#import "RTCModel.h"

@interface ScoreViewController ()

@end

@implementation ScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"RN传值";
    self.view.backgroundColor=[UIColor whiteColor];
    [self initNavigationBarNoLeftBack];
    [self  initSubView];
   
}

-(void)initSubView{
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 80)];
    [self.view addSubview:label];
    label.numberOfLines=0;
    label.textAlignment=NSTextAlignmentCenter;
    label.text=self.strings;
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.frame=CGRectMake(self.view.frame.size.width/2.0-60, CGRectGetMaxY(label.frame)+10, 120, 40);
    btn.backgroundColor=[UIColor redColor];
    [btn setTitle:@"iOS传递数据给RN" forState:UIControlStateNormal];
    btn.titleLabel.font=[UIFont systemFontOfSize:12];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)btnClick:(UIButton*)sender{
    [RTCModel emitEventWithName:@"EventReminder" andPayload:@{@"content":@"iOS传递数据给RN"}];
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
