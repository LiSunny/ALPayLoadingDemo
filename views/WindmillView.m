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


@end


static NSInteger duration = 1;

@implementation WindmillView


- (UIImageView *)imageView
{
    
    if (!_imageView) {
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
        _imageView.image = [UIImage imageNamed:@"ye"];
        
    }
    return _imageView;
    
}



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        isFrist = YES;
        [self addSubview:self.imageView];
        
    }
    return self;
}
- (void)windmillFire
{
    
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(startAnimation) userInfo:nil repeats:YES];
    
    
}
- (void)windmillStop
{
    [timer invalidate];
}

- (void)startAnimation
{
    
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.cumulative = YES;
    rotationAnimation.autoreverses = NO;
    
    if (isFrist) {
        rotationAnimation.duration = duration;
        isFrist = NO;
    }else{
        rotationAnimation.duration = duration/3.;
        isFrist = YES;
    }
    [self.imageView.layer addAnimation:rotationAnimation forKey:nil];
    
}



@end
