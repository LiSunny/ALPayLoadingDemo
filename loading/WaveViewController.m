//
//  WaveViewController.m
//  loading
//
//  Created by HeavenLi on 16/6/27.
//  Copyright © 2016年 HeavenLi. All rights reserved.
//

#import "WaveViewController.h"
#import "WaterView.h"
@interface WaveViewController ()

@property (nonatomic,strong) WaterView * Wview;
@end

@implementation WaveViewController


- (void)viewWillDisappear:(BOOL)animated
{
    [self.Wview clear];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.Wview = [[WaterView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame ) - 150)/2., (CGRectGetHeight(self.view.frame) - 150)/2., 150, 150)];
    [self.view addSubview:self.Wview];
    
    // Do any additional setup after loading the view.
}
- (IBAction)startAnimation:(id)sender {
    
    [self.Wview animationStart];
    
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
