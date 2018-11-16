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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    YYAnimatedImageView *imgView = [[YYAnimatedImageView alloc] init];
    imgView.frame = CGRectMake(20.f, 80.f, 200.f, 200.f);
    imgView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:imgView];
    
    NSURL *url = [NSURL URLWithString:@"http://mseekimg.stbl.cc/app/test.webp"];
    [imgView yy_setImageWithURL:url placeholder:nil];
    
    
    YYAnimatedImageView *imgView2 = [[YYAnimatedImageView alloc] init];
    imgView2.frame = CGRectMake(20.f, CGRectGetMaxY(imgView.frame) + 30.f, 200.f, 200.f);
    imgView2.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:imgView2];
    
    NSURL *url2 = [NSURL URLWithString:@"http://mseekimg.stbl.cc/app/out.webp"];
    [imgView2 yy_setImageWithURL:url2 placeholder:nil];
}


@end
