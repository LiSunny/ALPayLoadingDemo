//
//  AnimationView.h
//  loading
//
//  Created by HeavenLi on 16/6/22.
//  Copyright © 2016年 HeavenLi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    
    successType = 0,
    faileType,

}AnimationType;



@interface AnimationView : UIView


- (void)startAnimation;

- (void)stopAnimation:(AnimationType)type;

@end
