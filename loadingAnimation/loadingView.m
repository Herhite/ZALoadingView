//
//  loadingView.m
//  loadingAnimation
//
//  Created by 曾傲 on 2017/9/6.
//  Copyright © 2017年 曾傲. All rights reserved.
//

#import "loadingView.h"



@implementation loadingView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //        _angle = 6;
        /* 添加子控件的代码*/
        self.imageView = [[UIImageView alloc]init];
        self.imageView.image = [UIImage imageNamed:@"加载中"];
        [self addSubview:self.imageView];
        
    }
    return self;
}


//- (loadingView *)initWithFrame: (CGRect)frame
//{
//    if (self = [super initWithFrame:frame]) {
//        self.imageView = [[UIImageView alloc]init];
//        self.imageView.image = [UIImage imageNamed:@"加载中"];
//        [self addSubview:self.imageView];
//    }
//    return self;
//}
//+ (loadingView *)loadingViewWithFrame: (CGRect)frame
//{
//    return [[self alloc]initWithFrame:frame];
//}
+ (void)showLoadingViewWithSuperView:(UIView *)view
{
//    self = [[loadingView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    loadingView * loadView = [[self alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [view addSubview:loadView];
}

- (UIViewController *)currentViewController
{
    UIWindow *keyWindow  = [UIApplication sharedApplication].keyWindow;
    UIViewController *vc = keyWindow.rootViewController;
    while (vc.presentedViewController)
    {
        vc = vc.presentedViewController;
        
        if ([vc isKindOfClass:[UINavigationController class]])
        {
            vc = [(UINavigationController *)vc visibleViewController];
        }
        else if ([vc isKindOfClass:[UITabBarController class]])
        {
            vc = [(UITabBarController *)vc selectedViewController];
        }
    }
    return vc;
}
- (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}
+ (void) showLoadingView
{
    
    
    
    loadingView * loadView = [[self alloc]initWithFrame:[UIScreen mainScreen].bounds];
    UIViewController * currentVc = [loadView getCurrentVC];
    [currentVc.view addSubview:loadView];
}

- (void)layoutSubviews {
    // 一定要调用super的方法
    [super layoutSubviews];
    self.frame = [UIScreen mainScreen].bounds;
    
    self.imageView = [[UIImageView alloc]init];
    self.imageView.image = [UIImage imageNamed:@"加载中"];
    [self addSubview:self.imageView];
    
    // 确定子控件的frame（这里得到的self的frame/bounds才是准确的）
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    self.imageView.frame = CGRectMake(width/2-24.5, height/2-23.5, 49, 47);
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 1.0/30.0];
    rotationAnimation.duration = 0.02;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = MAXFLOAT;
    
    [self.imageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}
-(void)dealloc{
    
    NSLog(@"GG");
}
//+ (void) showLoadingViewWithSuperView:(UIView *)view
//{
//    
//    
//    
//    
//}


+ (void) hiddenLoadingViewWithSuperView:(UIView *)superView{
    for (UIView *  view in superView.subviews) {
        if ([view isKindOfClass:[loadingView class]]) {
            [view removeFromSuperview];
        }
    }
};



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
