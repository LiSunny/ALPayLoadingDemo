//
//  DDView.m
//  loading
//
//  Created by HeavenLi on 16/6/28.
//  Copyright © 2016年 HeavenLi. All rights reserved.
//

#import "DDView.h"


static NSInteger radius = 10;
static CGFloat animationD = 0.1;

@interface DDView ()
{
    
    NSArray * wavePathArr;
    int i;
    int count;
    NSTimer * timer;
    
}

@property (strong, nonatomic) CAShapeLayer * arc_layer1;
@property (strong, nonatomic) CAShapeLayer * arc_layer2;
@property (strong, nonatomic) CAShapeLayer * arc_layer3;
@property (strong, nonatomic) CAShapeLayer * arc_layer4;
@property (strong, nonatomic) CAShapeLayer * arc_layer5;


@end




@implementation DDView

- (CAShapeLayer *)arc_layer1
{
    
    if (!_arc_layer1) {
        
        _arc_layer1 = [[CAShapeLayer alloc] init];
        _arc_layer1.frame = CGRectMake(10, 10, radius * 2, radius * 2);
        _arc_layer1.backgroundColor = [UIColor redColor].CGColor;
        _arc_layer1.cornerRadius = radius;
    }
    
    return _arc_layer1;
}
- (CAShapeLayer *)arc_layer2
{
    
    if (!_arc_layer2) {
        
        _arc_layer2 = [[CAShapeLayer alloc] init];
        _arc_layer2.frame = CGRectMake(40, 10, radius * 2, radius * 2);
        _arc_layer2.backgroundColor = [UIColor orangeColor].CGColor;
        _arc_layer2.cornerRadius = radius;
    }
    
    return _arc_layer2;
}
- (CAShapeLayer *)arc_layer3
{
    
    if (!_arc_layer3) {
        
        _arc_layer3 = [[CAShapeLayer alloc] init];
        _arc_layer3.frame = CGRectMake(70, 10, radius * 2, radius * 2);
        _arc_layer3.backgroundColor = [UIColor yellowColor].CGColor;
        _arc_layer3.cornerRadius = radius;
    }
    
    return _arc_layer3;
}
- (CAShapeLayer *)arc_layer4
{
    
    if (!_arc_layer4) {
        
        _arc_layer4 = [[CAShapeLayer alloc] init];
        _arc_layer4.frame = CGRectMake(100, 10, radius * 2, radius * 2);
        _arc_layer4.backgroundColor = [UIColor greenColor].CGColor;
       _arc_layer4.cornerRadius = radius;
    }
    
    return _arc_layer4;
}
- (CAShapeLayer *)arc_layer5
{
    
    if (!_arc_layer5) {
        
        _arc_layer5 = [[CAShapeLayer alloc] init];
        _arc_layer5.frame = CGRectMake(130, 10, radius * 2, radius * 2);
        _arc_layer5.backgroundColor = [UIColor blueColor].CGColor;
        _arc_layer5.cornerRadius = radius;
    }
    
    return _arc_layer5;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame];
    
    if (self) {
        
        i = 1;
        count = 1;
        
        [self.layer addSublayer:self.arc_layer1];
        [self.layer addSublayer:self.arc_layer2];
        [self.layer addSublayer:self.arc_layer3];
        [self.layer addSublayer:self.arc_layer4];
        [self.layer addSublayer:self.arc_layer5];
        
        
        
    }
    return self;
}
- (void)startAnimation
{
    timer = [NSTimer scheduledTimerWithTimeInterval:animationD * 2 target:self selector:@selector(Animation) userInfo:nil repeats:YES];
}
- (void)Animation
{
    
    //移动动画
    CABasicAnimation * arc1_an_p = [CABasicAnimation animationWithKeyPath:@"position"];
    arc1_an_p.fromValue = [NSValue valueWithCGPoint:CGPointMake(20, 10)];
    arc1_an_p.toValue = [NSValue valueWithCGPoint:CGPointMake(20, 0)];
    arc1_an_p.fillMode=kCAFillModeForwards;
    arc1_an_p.autoreverses=YES;
    arc1_an_p.duration=animationD;
    
    CABasicAnimation * arc2_an_p = [CABasicAnimation animationWithKeyPath:@"position"];
    arc2_an_p.fromValue = [NSValue valueWithCGPoint:CGPointMake(50, 10)];
    arc2_an_p.toValue = [NSValue valueWithCGPoint:CGPointMake(50, 0)];
    arc2_an_p.fillMode=kCAFillModeForwards;
    arc2_an_p.autoreverses=YES;
    arc2_an_p.duration=animationD;
    
    CABasicAnimation * arc3_an_p = [CABasicAnimation animationWithKeyPath:@"position"];
    arc3_an_p.fromValue = [NSValue valueWithCGPoint:CGPointMake(80, 10)];
    arc3_an_p.toValue = [NSValue valueWithCGPoint:CGPointMake(80, 0)];
    arc3_an_p.fillMode=kCAFillModeForwards;
    arc3_an_p.autoreverses=YES;
    arc3_an_p.duration=animationD;
    
    CABasicAnimation * arc4_an_p = [CABasicAnimation animationWithKeyPath:@"position"];
    arc4_an_p.fromValue = [NSValue valueWithCGPoint:CGPointMake(110, 10)];
    arc4_an_p.toValue = [NSValue valueWithCGPoint:CGPointMake(110, 0)];
    arc4_an_p.fillMode=kCAFillModeForwards;
    arc4_an_p.autoreverses=YES;
    arc4_an_p.duration=animationD;
    
    CABasicAnimation * arc5_an_p = [CABasicAnimation animationWithKeyPath:@"position"];
    arc5_an_p.fromValue = [NSValue valueWithCGPoint:CGPointMake(140, 10)];
    arc5_an_p.toValue = [NSValue valueWithCGPoint:CGPointMake(140, 0)];
    arc5_an_p.fillMode=kCAFillModeForwards;
    arc5_an_p.autoreverses=YES;
    arc5_an_p.duration=animationD;
    
    if (i  >= 1 && i <= 5) {
        switch (i) {
            case 1:
                [self.arc_layer1 addAnimation:arc1_an_p forKey:nil];
                break;
            case 2:
                [self.arc_layer2 addAnimation:arc2_an_p forKey:nil];
                break;
            case 3:
                [self.arc_layer3 addAnimation:arc3_an_p forKey:nil];
                break;
            case 4:
                [self.arc_layer4 addAnimation:arc4_an_p forKey:nil];
                break;
            case 5:
                [self.arc_layer5 addAnimation:arc5_an_p forKey:nil];
                break;
            default:
                break;
        }
        
        i ++;
    }else{
        
        i = 1;
        
        if (count == 3) {
            
            [self stopAnimation];
            count = 1;
            
        }
        
        count ++;
        
    }
    
}
- (void)stopAnimation
{
    
    [timer invalidate];
    
}






@end
