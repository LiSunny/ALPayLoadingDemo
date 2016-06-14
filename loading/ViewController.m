//
//  ViewController.m
//  loading
//
//  Created by HeavenLi on 16/6/14.
//  Copyright © 2016年 HeavenLi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    
    float add;
    NSTimer * timer;
}
@property (nonatomic,strong) CAShapeLayer * shapeLayer;

@property (nonatomic,strong) CAShapeLayer * arrowLayer;

@end

@implementation ViewController

- (CAShapeLayer *)shapeLayer
{
    if (!_shapeLayer) {
        
        _shapeLayer = [[CAShapeLayer alloc] init];
        _shapeLayer.frame = CGRectMake((self.view.frame.size.width - 60)/2., (self.view.frame.size.height - 60)/2., 60, 60);
        _shapeLayer.strokeColor = [UIColor colorWithRed:0.13 green:0.51 blue:0.96 alpha:1.00].CGColor;
        _shapeLayer.fillColor = [UIColor clearColor].CGColor;
        _shapeLayer.strokeEnd = 0;
        _shapeLayer.strokeStart = 0;
        _shapeLayer.lineWidth = 5;
        _shapeLayer.lineCap = @"round";
        _shapeLayer.lineJoin = @"round";
        
        UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 60, 60)];
        _shapeLayer.path = path.CGPath;
        
    }
    
    return _shapeLayer;
}
- (CAShapeLayer *)arrowLayer
{
    if (!_arrowLayer) {
        
        _arrowLayer = [[CAShapeLayer alloc] init];
        _arrowLayer.frame = CGRectMake((self.view.frame.size.width - 60)/2., (self.view.frame.size.height - 60)/2., 60, 60);
        _arrowLayer.strokeColor = [UIColor colorWithRed:0.13 green:0.51 blue:0.96 alpha:1.00].CGColor;
        _arrowLayer.fillColor = [UIColor clearColor].CGColor;
        _arrowLayer.strokeEnd = 0;
        _arrowLayer.strokeStart = 0;
        _arrowLayer.lineWidth = 5;
        _arrowLayer.lineCap = @"round";
        _arrowLayer.lineJoin = @"round";
        
        UIBezierPath * path = [UIBezierPath bezierPath];
        
        [path moveToPoint:CGPointMake(13, 28)];
        [path addLineToPoint:CGPointMake(25, 45)];
        [path addLineToPoint:CGPointMake(50, 15)];
        
        _arrowLayer.path = path.CGPath;
        
    }
    
    return _arrowLayer;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    add = 0.1;
    
    [self.view.layer addSublayer:self.shapeLayer];
    
    [self.view.layer addSublayer:self.arrowLayer];
    
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake((self.view.frame.size.width - 100)/2., 60, 100, 40);
    [btn setTitle:@"开始" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor colorWithRed:0.34 green:0.34 blue:0.34 alpha:1.00]];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)BtnClick:(UIButton *)btn
{
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(shapeLayerTimer) userInfo:nil repeats:YES];
    
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(finish) userInfo:nil repeats: NO];

}

- (void)shapeLayerTimer
{
    if (self.shapeLayer.strokeEnd>1 && self.shapeLayer.strokeStart <1) {
        self.shapeLayer.strokeStart += add;
    }else if (self.shapeLayer.strokeStart == 0) {
        self.shapeLayer.strokeEnd += add;
    }
    
    if (self.shapeLayer.strokeEnd == 0) {
        self.shapeLayer.strokeStart = 0;
    }
    
    if (self.shapeLayer.strokeStart == self.shapeLayer.strokeEnd) {
        self.shapeLayer.strokeEnd = 0;
    }
    
    
}
- (void)finish
{
    [timer invalidate];
    self.shapeLayer.strokeStart = 0;
    self.shapeLayer.strokeEnd = 1;
    for (int i = 0; i < 10; i ++) {
        self.arrowLayer.strokeEnd += add;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
