//
//  ViewController.m
//  BounceEffect
//
//  Created by DreamHack on 15-10-13.
//  Copyright (c) 2015年 DreamHack. All rights reserved.
//

#import "ViewController.h"
#import "DHBounceView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    DHBounceView * bounceView = [[DHBounceView alloc] initWithContentsFrame:CGRectMake(220, 80, 120, 40) interval:10];
    [self.view addSubview:bounceView];
    
    self.view.layer.contents = (__bridge id)[UIImage imageNamed:@"bg.jpg"].CGImage;
    
    UIBlurEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
    UIVibrancyEffect * vibrancyEffect = [UIVibrancyEffect effectForBlurEffect:blurEffect];
    
    UIVisualEffectView * effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    effectView.frame = bounceView.bounds;
    [bounceView addSubview:effectView];
    
    UIVisualEffectView * vibrancyEffectView = [[UIVisualEffectView alloc] initWithEffect:vibrancyEffect];
    vibrancyEffectView.frame = effectView.bounds;
    [effectView.contentView addSubview:vibrancyEffectView];
    
    UILabel * label = [[UILabel alloc] initWithFrame:bounceView.privateContentsFrame];
    label.text = @"登录";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:22];
    label.textAlignment = NSTextAlignmentCenter;
    
    [vibrancyEffectView.contentView addSubview:label];
}


@end
