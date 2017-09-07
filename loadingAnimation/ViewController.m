//
//  ViewController.m
//  loadingAnimation
//
//  Created by 曾傲 on 2017/9/6.
//  Copyright © 2017年 曾傲. All rights reserved.
//

#import "ViewController.h"
#import "loadingView.h"

@interface ViewController ()
{
    NSInteger angle;
    UIImageView * imageView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
//    loadingView * view = [[loadingView alloc]initWithFrame:CGRectMake(100, 100, 49, 47)];
//    [self.view addSubview:view];
    
    
    
    [loadingView showLoadingViewWithSuperView:self.view];
    
    [self performSelector:@selector(gogogo) withObject:nil afterDelay:3.0];
    
//    [loadingView showLoadingView];
    
    
    
//    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 49, 47)];
//    imageView.image = [UIImage imageNamed:@"加载中"];
//    angle = 6;
//    [self.view addSubview:imageView];
//    [self startAnimation];

    
    
}
-(void)gogogo{
    [loadingView hiddenLoadingViewWithSuperView:self.view];
}

-(void) startAnimation
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.01];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(endAnimation)];
    imageView.transform = CGAffineTransformMakeRotation(angle * (M_PI / 180.0f));
    [UIView commitAnimations];
}

-(void)endAnimation
{
    angle += 6;
    [self startAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
