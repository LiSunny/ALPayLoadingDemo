//
//  WaterView.m
//  loading
//
//  Created by HeavenLi on 16/6/22.
//  Copyright © 2016年 HeavenLi. All rights reserved.
//

#import "WaterView.h"

@interface WaterView ()
{
    
    NSArray * wavePathArr;
    int i;
    CGFloat width;
    CGFloat heigh;
    NSTimer * timer;
    
}

@property (strong, nonatomic) CAShapeLayer * animationLayer;
@property (strong, nonatomic) UIBezierPath * wavePathPre;
@property (strong, nonatomic) UIBezierPath * wavePathStarting;
@property (strong, nonatomic) UIBezierPath * wavePathLow;
@property (strong, nonatomic) UIBezierPath * wavePahtMinLow;
@property (strong, nonatomic) UIBezierPath * wavePathMid;
@property (strong, nonatomic) UIBezierPath * wavePathMidTop;
@property (strong, nonatomic) UIBezierPath * wavePathHigh;
@property (strong, nonatomic) UIBezierPath * wavePathComplete;



@end

static NSInteger radius = 75;


@implementation WaterView

- (CAShapeLayer *)animationLayer
{
 
    if (!_animationLayer) {
        
        _animationLayer = [[CAShapeLayer alloc] init];
        _animationLayer.backgroundColor = [UIColor yellowColor].CGColor;
        _animationLayer.frame = CGRectMake(0, 0, width, heigh);
        _animationLayer.cornerRadius = radius;
        _animationLayer.fillColor = [UIColor colorWithRed:0.92 green:0.44 blue:0.40 alpha:1.00].CGColor;
        
    }
    
    return _animationLayer;
}
- (UIBezierPath *)wavePathPre
{
    if (!_wavePathPre) {
        
        _wavePathPre = [[UIBezierPath alloc] init];
        [_wavePathPre addArcWithCenter:CGPointMake(radius, radius) radius:radius startAngle: M_PI_2 - M_PI_4/2. endAngle: M_PI_2 + M_PI_4/2.  clockwise:YES];
        [_wavePathPre closePath];
        
    }
    return _wavePathPre;
}
- (UIBezierPath *)wavePathStarting
{
    if (!_wavePathStarting) {
        
        _wavePathStarting = [[UIBezierPath alloc] init];
        [_wavePathStarting addArcWithCenter:CGPointMake(radius, radius) radius:radius startAngle: M_PI_2 - M_PI_4 endAngle: M_PI_2 + M_PI_4 clockwise:YES];
        CGFloat point2X = [self getPointX:M_PI_2 - M_PI_4];
        CGFloat point2Y = [self getPointY:M_PI_2 - M_PI_4];
        CGFloat space2X = [self getSpace:point2X];
        [_wavePathStarting addCurveToPoint:CGPointMake(point2X, point2Y) controlPoint1:CGPointMake(space2X * 1, point2Y + 5) controlPoint2:CGPointMake(space2X * 2, point2Y - 5)];
        [_wavePathStarting closePath];
        
    }
    return _wavePathStarting;
}
- (UIBezierPath *)wavePathLow
{
    if (!_wavePathLow) {
        
        _wavePathLow = [[UIBezierPath alloc] init];
        [_wavePathLow addArcWithCenter:CGPointMake(radius, radius) radius:radius startAngle:M_PI_2 - (M_PI_4 + M_PI_4/2.) endAngle:M_PI_2 + (M_PI_4 + M_PI_4/2.) clockwise:YES];
        //起点x
        CGFloat point3X = [self getPointX:M_PI_2 - (M_PI_4 + M_PI_4/2.) ];
        //起点y
        CGFloat point3Y = [self getPointY:M_PI_2 - (M_PI_4 + M_PI_4/2.)];
        CGFloat space3X = [self getSpace:point3X];
        [_wavePathLow addCurveToPoint:CGPointMake(point3X, point3Y) controlPoint1:CGPointMake(space3X * 1, point3Y - 10) controlPoint2:CGPointMake(space3X * 2, point3Y + 10)];
        [_wavePathLow closePath];
        
    }
    return _wavePathLow;
}

- (UIBezierPath *)wavePahtMinLow
{
    if (!_wavePahtMinLow) {
        
        _wavePahtMinLow = [[UIBezierPath alloc] init];
        [_wavePahtMinLow addArcWithCenter:CGPointMake(radius, radius) radius:radius startAngle:0 endAngle:M_PI clockwise:YES];
        //起点x
        CGFloat point3mX = [self getPointX:0 ];
        //起点y
        CGFloat point3mY = [self getPointY:0];
        CGFloat space3mX = [self getSpace:point3mX];
        [_wavePahtMinLow addCurveToPoint:CGPointMake(point3mX, point3mY) controlPoint1:CGPointMake(space3mX * 1, point3mY + 15) controlPoint2:CGPointMake(space3mX * 2, point3mY - 10)];
        [_wavePahtMinLow closePath];
        
    }
    return _wavePahtMinLow;
}
- (UIBezierPath *)wavePathMid
{
    if (!_wavePathMid) {
        
        _wavePathMid = [[UIBezierPath alloc] init];
        [_wavePathMid addArcWithCenter:CGPointMake(radius, radius) radius:radius startAngle:M_PI * 2 - M_PI_4/2. endAngle:M_PI + M_PI_4/2. clockwise:YES];
        CGFloat point4X = [self getPointX: M_PI * 2 - M_PI_4/2.];
        CGFloat point4Y = [self getPointY:M_PI * 2 - M_PI_4/2.];
        CGFloat space4X = [self getSpace:point4X];
        [_wavePathMid addCurveToPoint:CGPointMake(point4X, point4Y) controlPoint1:CGPointMake(space4X * 1, point4Y - 20 ) controlPoint2:CGPointMake(space4X * 2, point4Y + 15)];
        [_wavePathMid closePath];
        
    }
    return _wavePathMid;
}
- (UIBezierPath *)wavePathMidTop
{
    if (!_wavePathMidTop) {
        
        _wavePathMidTop = [[UIBezierPath alloc] init];
        [_wavePathMidTop addArcWithCenter:CGPointMake(radius, radius) radius:radius startAngle:M_PI * 2 - M_PI_4 endAngle:M_PI + M_PI_4 clockwise:YES];
        CGFloat point4TopX = [self getPointX: M_PI * 2 - M_PI_4];
        CGFloat point4TopY = [self getPointY:M_PI * 2 - M_PI_4];
        CGFloat space4TopX = [self getSpace:point4TopX];
        [_wavePathMidTop addCurveToPoint:CGPointMake(point4TopX, point4TopY) controlPoint1:CGPointMake(space4TopX * 1 + 15, point4TopY + 10 ) controlPoint2:CGPointMake(space4TopX * 2, point4TopY - 10)];
        [_wavePathMidTop closePath];
        
    }
    return _wavePathMidTop;
}
- (UIBezierPath *)wavePathHigh
{
    if (!_wavePathHigh) {
        
        _wavePathHigh = [[UIBezierPath alloc] init];
        [_wavePathHigh addArcWithCenter:CGPointMake(radius, radius) radius:radius startAngle:M_PI * 2 - M_PI_4 -M_PI_4/2. endAngle:M_PI + M_PI_4 + M_PI_4/2. clockwise:YES];
        [_wavePathHigh closePath];
        
    }
    return _wavePathHigh;
}
- (UIBezierPath *)wavePathComplete
{
    if (!_wavePathComplete) {
        
        _wavePathComplete = [[UIBezierPath alloc] init];
        [_wavePathComplete addArcWithCenter:CGPointMake(radius, radius) radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
        [_wavePathComplete closePath];
        
    }
    return _wavePathComplete;
}


- (id)initWithFrame:(CGRect)frame
{
    
    width = frame.size.width;
    heigh = frame.size.height;
    
    wavePathArr = [NSArray arrayWithObjects:self.wavePathPre,self.wavePathStarting,self.wavePathLow,self.wavePahtMinLow,self.wavePathMid,self.wavePathMidTop,self.wavePathHigh,self.wavePathComplete, nil];
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.layer.cornerRadius = 75;
        self.layer.borderColor = [UIColor colorWithRed:0.34 green:0.34 blue:0.34 alpha:1.00].CGColor;
        self.layer.borderWidth = 2;
        
        [self.layer addSublayer:self.animationLayer];
        
        
    }
    return self;
    
}
- (void)animationStart
{
     timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(layerChange) userInfo:nil repeats:YES];
}

- (void)clear
{
    [timer invalidate];
}

- (void)layerChange
{
    if (i <= 7 & i > 0) {
        UIBezierPath * path = [wavePathArr objectAtIndex:i];
        
        self.animationLayer.path = path.CGPath;
        
        i ++;
    }else{
        i = 1;
    }
    
}


- (CGFloat)getPointX:(CGFloat)angle
{
    //目前的设计思路只会有270 - 360 或 0 - 90
    CGFloat point;
    //180 - 270
    if (angle >= M_PI && angle < M_PI_2 + M_PI) {
        
        
        //270 - 360
    }else if (angle >= M_PI + M_PI_2 && angle < M_PI * 2){
        
        point = cos(M_PI * 2 - angle) * radius + radius;
        
        //90 -180
    }else if (angle >= M_PI_2 && angle < M_PI ){
        
        
        //0 - 90
    }else if (angle >= 0  && angle < M_PI_2){
        
        point = sin(M_PI_2 - angle)*radius + radius;
        
    }
    return point;
}
- (CGFloat)getPointY:(CGFloat)angle
{
    
    //目前的设计思路只会有270 - 360 或 0 - 90
    CGFloat point;
    //180 - 270
    if (angle >= M_PI && angle < M_PI_2 + M_PI) {
        
        
        //270 - 360
    }else if (angle >= M_PI + M_PI_2 && angle < M_PI * 2){
        
        point = radius - sin(M_PI * 2 - angle) * radius;
        
        //90 -180
    }else if (angle >= M_PI_2 && angle < M_PI ){
        
        
        //0 - 90
    }else if (angle >= 0  && angle < M_PI_2){
        
        point = radius*2 - (radius - cos(M_PI_2 - angle)*radius);
        
    }
    
    return point;
}
- (CGFloat)getSpace:(CGFloat)angle
{
    CGFloat space = (angle - radius) * 2/3.;
    return space;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
