//
//  WindmillView.m
//  loading
//
//  Created by HeavenLi on 16/6/30.
//  Copyright © 2016年 HeavenLi. All rights reserved.
//

#import "WindmillView.h"



@interface WindmillView ()
{
    BOOL isFrist;
    NSTimer * timer;
}

@property (nonatomic,strong) UIImageView * imageView;
@property (nonatomic,strong) UIImageView * bgImageView;

@end




@implementation WindmillView
- (UIImageView *)bgImageView
{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 120, 150)];
        _bgImageView.image = [UIImage imageNamed:@"BG"];
    }
    return _bgImageView;
}

- (UIImageView *)imageView
{
    
    if (!_imageView) {
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(14, 14, 112, 112)];
        _imageView.image = [UIImage imageNamed:@"icon"];
        
    }
    return _imageView;
    
}



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        isFrist = YES;
        [self addSubview:self.imageView];
        [self addSubview:self.bgImageView];
        
    }
    return self;
}
- (void)windmillFire
{
 
    [self startWindAnimation];
    timer = [NSTimer scheduledTimerWithTimeInterval:6.85 target:self selector:@selector(startWindAnimation) userInfo:nil repeats:YES];
    
}
- (void)windmillStop
{
    [timer invalidate];
}

- (void)startWindAnimation
{
    
        //开始动画慢 1秒 2pi
        CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation.fromValue = [NSNumber numberWithFloat:0.0];
        rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 4.0 ];
        rotationAnimation.duration = 2;
        
        //加速缓冲动画 0.8秒 2pi
        CABasicAnimation * rotationAnimation1 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation1.fromValue = [NSNumber numberWithFloat:M_PI * 4.0];
        rotationAnimation1.toValue = [NSNumber numberWithFloat:M_PI * 6.0];
        rotationAnimation1.beginTime = rotationAnimation.beginTime + rotationAnimation.duration;
        rotationAnimation1.duration = 0.8;
        
        //加速动画 0.5秒 2pi
        CABasicAnimation * rotationAnimation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation2.fromValue = [NSNumber numberWithFloat:M_PI * 6.0];
        rotationAnimation2.toValue = [NSNumber numberWithFloat:M_PI * 8.0];
        rotationAnimation2.beginTime = rotationAnimation1.beginTime + rotationAnimation1.duration;
        rotationAnimation2.duration = 0.5;
        
        //加速中动画 0.25秒 2pi
        CABasicAnimation * rotationAnimation3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation3.fromValue = [NSNumber numberWithFloat:M_PI * 8.0];
        rotationAnimation3.toValue = [NSNumber numberWithFloat:M_PI * 28.0];
        rotationAnimation3.beginTime = rotationAnimation2.beginTime + rotationAnimation2.duration;
        rotationAnimation3.duration = 5;
        
        //减速动画 0.5秒 2pi
        CABasicAnimation * rotationAnimation4 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation4.fromValue = [NSNumber numberWithFloat:M_PI * 28.0];
        rotationAnimation4.toValue = [NSNumber numberWithFloat:M_PI * 30.0];
        rotationAnimation4.beginTime = rotationAnimation3.beginTime + rotationAnimation3.duration;
        rotationAnimation4.duration = 0.5;
        
        //减速缓冲动画 0.8秒 2pi
        CABasicAnimation * rotationAnimation5 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation5.fromValue = [NSNumber numberWithFloat:M_PI * 30.0];
        rotationAnimation5.toValue = [NSNumber numberWithFloat:M_PI * 32.0];
        rotationAnimation5.beginTime = rotationAnimation4.beginTime + rotationAnimation4.duration;
        rotationAnimation5.duration = 0.8;
        
        //开始动画慢 1秒 2pi
        CABasicAnimation * rotationAnimation6 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation6.fromValue = [NSNumber numberWithFloat:M_PI * 32.0];
        rotationAnimation6.toValue = [NSNumber numberWithFloat:M_PI * 36.0];
        rotationAnimation6.beginTime = rotationAnimation5.beginTime + rotationAnimation5.duration;
        rotationAnimation6.duration = 2;
        
        
        CAAnimationGroup * group = [[CAAnimationGroup alloc] init];
        group.animations = @[rotationAnimation,rotationAnimation1,rotationAnimation2,rotationAnimation3,rotationAnimation4,rotationAnimation5,rotationAnimation6];
        group.duration = rotationAnimation6.beginTime + rotationAnimation6.duration;
        group.fillMode = kCAFillModeForwards;
        group.removedOnCompletion = NO;
        
        [self.imageView.layer addAnimation:group forKey:nil];
    
}



@end
