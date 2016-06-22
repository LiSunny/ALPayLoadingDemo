//
//  ViewController.m
//  loading
//
//  Created by HeavenLi on 16/6/14.
//  Copyright © 2016年 HeavenLi. All rights reserved.
//

#import "ViewController.h"

#import "AnimationView.h"

@interface ViewController ()
{

    AnimationView * view;
}


@end

@implementation ViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    view = [[AnimationView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame ) - 150)/2., (CGRectGetHeight(self.view.frame) - 150)/2., 150, 150)];
    
    [self.view addSubview:view];
    
    
    

}

- (IBAction)startAnimation:(id)sender {
    
     [view startAnimation];
    
}
- (IBAction)successAnimation:(id)sender {
    [view stopAnimation:successType];
}
- (IBAction)faileAnimation:(id)sender {
    [view stopAnimation:faileType];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
