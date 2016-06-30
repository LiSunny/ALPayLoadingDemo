//
//  WindmillViewController.m
//  loading
//
//  Created by HeavenLi on 16/6/30.
//  Copyright © 2016年 HeavenLi. All rights reserved.
//

#import "WindmillViewController.h"

#import "WindmillView.h"

@interface WindmillViewController ()
{
    
    WindmillView * windView;
    
}
@end

@implementation WindmillViewController
- (void)viewWillDisappear:(BOOL)animated
{
    [windView windmillStop];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    windView = [[WindmillView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame) - 110)/2., (CGRectGetHeight(self.view.frame) - 110)/2., 110, 110)];
    [self.view addSubview:windView];
    
    // Do any additional setup after loading the view.
}
- (IBAction)startAnimation:(id)sender {
    
    [windView windmillFire];
    
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
