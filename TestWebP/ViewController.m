//
//  ViewController.m
//  TestWebP
//
//  Created by xixi on 2018/11/16.
//  Copyright © 2018 xixi. All rights reserved.
//

#import "ViewController.h"
//#import <UIImageView+WebCache.h>
#import <YYWebImage.h>

#define kScreen_Width ([[UIScreen mainScreen] bounds].size.width)   //全屏宽度
#define kScreen_Height ([[UIScreen mainScreen] bounds].size.height) //全屏高度

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat width = (kScreen_Width - 30) / 2.f;
    
    YYAnimatedImageView *imgView = [[YYAnimatedImageView alloc] init];
    imgView.frame = CGRectMake(10.f, 80.f, width, width);
    imgView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:imgView];
    
    NSURL *url = [NSURL URLWithString:@"http://mseekimg.stbl.cc/app/test.webp"];
    [imgView yy_setImageWithURL:url placeholder:nil];
    
    
    YYAnimatedImageView *imgView2 = [[YYAnimatedImageView alloc] init];
    imgView2.frame = CGRectMake(CGRectGetMaxX(imgView.frame) + 10.f, CGRectGetMinY(imgView.frame), width, width);
    imgView2.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:imgView2];
    
//    NSURL *url2 = [NSURL URLWithString:@"http://mseekimg.stbl.cc/app/out.webp"];
    NSURL *url2 = [NSURL URLWithString:@"http://pia2njyxv.bkt.clouddn.com/out.webp"];
    [imgView2 yy_setImageWithURL:url2 placeholder:nil];
    
    
    
    YYAnimatedImageView *imgView3 = [[YYAnimatedImageView alloc] init];
    imgView3.frame = CGRectMake(10.f, CGRectGetMaxY(imgView.frame) + 20.f, width, width);
    imgView3.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:imgView3];
    
    NSURL *url3 = [NSURL URLWithString:@"http://mseekimg.stbl.cc/pre/gifts/gift_send_5_1541749467.gif"];
    [imgView3 yy_setImageWithURL:url3 placeholder:nil];
    
    UIImageView *img = [[UIImageView alloc] init];
    img.frame = CGRectMake(CGRectGetMinX(imgView2.frame), CGRectGetMinY(imgView3.frame), width, width);
    [self.view addSubview:img];
    
    
}


@end
