//
//  DDViewController.m
//  loading
//
//  Created by HeavenLi on 16/6/28.
//  Copyright © 2016年 HeavenLi. All rights reserved.
//

#import "DDViewController.h"
#import "DDView.h"

@interface DDViewController ()
{
    DDView * view;
}


@end

@implementation DDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    view = [[DDView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame) - 160)/2., 300, 160, 40)];
    [self.view addSubview:view];
    
    // Do any additional setup after loading the view.
}
- (void)viewWillDisappear:(BOOL)animated
{
    [view stopAnimation];
}
- (IBAction)startAnimation:(id)sender {
    [view startAnimation];
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
