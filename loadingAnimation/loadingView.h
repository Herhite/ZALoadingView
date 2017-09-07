//
//  loadingView.h
//  loadingAnimation
//
//  Created by 曾傲 on 2017/9/6.
//  Copyright © 2017年 曾傲. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface loadingView : UIView

@property (nonatomic, strong) UIImageView *imageView;
//@property (nonatomic, assign) NSInteger angle;
//- (Person *)initWithName:(NSString *)name;
//+ (Person *)personWithName:(NSString *)name;
+ (void)showLoadingViewWithSuperView:(UIView *)view;

//- (loadingView *)initWithFrame: (CGRect)frame;
//+ (loadingView *)loadingViewWithFrame: (CGRect)frame;
//+ (void) showLoadingView;
+ (void) hiddenLoadingViewWithSuperView:(UIView *)superView;
//+ (void) hiddenLoadingView;

@end
