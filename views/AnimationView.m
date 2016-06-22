//
//  AnimationView.m
//  loading
//
//  Created by HeavenLi on 16/6/22.
//  Copyright © 2016年 HeavenLi. All rights reserved.
//

#import "AnimationView.h"


@interface AnimationView ()
{
    
    float add;
    NSTimer * timer;
}

//圆形贝塞尔曲线
@property (nonatomic,strong) UIBezierPath * ovallnPath;
//成功尖头贝赛尔曲线
@property (nonatomic,strong) UIBezierPath * arrowPath;
//失败贝赛尔曲线
@property (nonatomic,strong) UIBezierPath * failePath;
//圆形layer
@property (nonatomic,strong) CAShapeLayer * ovallnLayer;
//尖头layer
@property (nonatomic,strong) CAShapeLayer * arrowLayer;


@end





@implementation AnimationView
- (UIBezierPath *)ovallnPath
{
    if (!_ovallnPath) {
        
        _ovallnPath =  [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 60, 60)];
        
    }
    return _ovallnPath;
}
- (UIBezierPath *)arrowPath
{
    if (!_arrowPath) {
        
        _arrowPath =  [UIBezierPath bezierPath];
        [_arrowPath moveToPoint:CGPointMake(13, 28)];
        [_arrowPath addLineToPoint:CGPointMake(25, 45)];
        [_arrowPath addLineToPoint:CGPointMake(50, 15)];
        
    }
    return _arrowPath;
}
- (UIBezierPath *)failePath
{
    if (!_failePath) {
        
        _failePath = [UIBezierPath bezierPath];
        [_failePath moveToPoint:CGPointMake(17, 13)];
        [_failePath addLineToPoint:CGPointMake(43, 45)];
        [_failePath moveToPoint:CGPointMake(43, 13)];
        [_failePath addLineToPoint:CGPointMake(17, 45)];
        
    }
    return _failePath;
}
- (CAShapeLayer *)ovallnLayer
{
    if (!_ovallnLayer) {
        
        _ovallnLayer = [[CAShapeLayer alloc] init];
        _ovallnLayer.frame = CGRectMake((self.frame.size.width - 60)/2., (self.frame.size.height - 60)/2., 60, 60);
        _ovallnLayer.strokeColor = [UIColor colorWithRed:0.13 green:0.51 blue:0.96 alpha:1.00].CGColor;
        _ovallnLayer.fillColor = [UIColor clearColor].CGColor;
        _ovallnLayer.strokeEnd = 0;
        _ovallnLayer.strokeStart = 0;
        _ovallnLayer.lineWidth = 5;
        _ovallnLayer.lineCap = @"round";
        _ovallnLayer.lineJoin = @"round";
        
        _ovallnLayer.path = self.ovallnPath.CGPath;
        
    }
    
    return _ovallnLayer;
}

- (CAShapeLayer *)arrowLayer
{
    if (!_arrowLayer) {
        
        _arrowLayer = [[CAShapeLayer alloc] init];
        _arrowLayer.frame = CGRectMake((self.frame.size.width - 60)/2., (self.frame.size.height - 60)/2., 60, 60);
        _arrowLayer.strokeColor = [UIColor colorWithRed:0.13 green:0.51 blue:0.96 alpha:1.00].CGColor;
        _arrowLayer.fillColor = [UIColor clearColor].CGColor;
        _arrowLayer.strokeEnd = 0;
        _arrowLayer.strokeStart = 0;
        _arrowLayer.lineWidth = 5;
        _arrowLayer.lineCap = @"round";
        _arrowLayer.lineJoin = @"round";
        
        
    }
    
    return _arrowLayer;
}



- (id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame: frame];
    
    if (self) {
        
        add = 0.1;
        
        [self.layer addSublayer:self.ovallnLayer];
        [self.layer addSublayer:self.arrowLayer];
        
    }
    
    return self;
    
}

- (void)startAnimation
{
    
    if (self.ovallnLayer.strokeEnd == 1 & self.ovallnLayer.strokeStart == 0 && self.arrowLayer.strokeEnd >= 1) {
        self.ovallnLayer.strokeStart = 0;
        self.ovallnLayer.strokeEnd = 0;
        self.arrowLayer.strokeEnd = 0;
    }
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(shapeLayerTimer) userInfo:nil repeats:YES];
}

- (void)stopAnimation:(AnimationType)type
{
     [timer invalidate];
    if (type == successType) {
        self.arrowLayer.path = self.arrowPath.CGPath;
        self.ovallnLayer.strokeStart = 0;
        self.ovallnLayer.strokeEnd = 1;
        for (int i = 0; i < 10; i ++) {
            self.arrowLayer.strokeEnd += add;
        }
    }else{
        self.arrowLayer.path = self.failePath.CGPath;
        self.arrowLayer.strokeColor = [UIColor colorWithRed:0.87 green:0.10 blue:0.13 alpha:1.00].CGColor;
        self.ovallnLayer.strokeColor = [UIColor colorWithRed:0.87 green:0.10 blue:0.13 alpha:1.00].CGColor;
        self.ovallnLayer.strokeStart = 0;
        self.ovallnLayer.strokeEnd = 1;
        for (int i = 0; i < 10; i ++) {
            self.arrowLayer.strokeEnd += add;
        }
    }
    
   
    
}


- (void)shapeLayerTimer
{
    if (self.ovallnLayer.strokeEnd>1 && self.ovallnLayer.strokeStart <1) {
        self.ovallnLayer.strokeStart += add;
    }else if (self.ovallnLayer.strokeStart == 0) {
        self.ovallnLayer.strokeEnd += add;
    }
    
    if (self.ovallnLayer.strokeEnd == 0) {
        self.ovallnLayer.strokeStart = 0;
    }
    
    if (self.ovallnLayer.strokeStart == self.ovallnLayer.strokeEnd) {
        self.ovallnLayer.strokeEnd = 0;
    }
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
