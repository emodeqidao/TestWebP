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
#import "Person.pbobjc.h"

#define kScreen_Width ([[UIScreen mainScreen] bounds].size.width)   //全屏宽度
#define kScreen_Height ([[UIScreen mainScreen] bounds].size.height) //全屏高度

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Person *per = [[Person alloc] init];
    per.name = @"xixi";
    per.age = @"18";
    NSData * data = [per data];
    NSLog(@"ProtocolBuffers data length : %zd", data.length);
    
    NSDictionary *dic = @{@"name":@"xixi", @"age":@"18"};
    NSData *jsonData= [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    NSLog(@"json data length : %zd", jsonData.length);
    NSDictionary *dictionary =[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:nil];
    NSLog(@"%@", dictionary);
    
    // data转对象
    NSError * error = nil;
    Person * toObj = [Person parseFromData:data error:&error];
    
    NSLog(@"\toObj -- %@", toObj);
    
    
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
    
    
    UIImageView *avatarImgView = [[UIImageView alloc] init];
    avatarImgView.frame = CGRectMake(20, 500, 80, 80);
    avatarImgView.layer.cornerRadius = 10.f;
    avatarImgView.layer.borderColor = [UIColor whiteColor].CGColor;
    avatarImgView.layer.borderWidth = 2.f;
    avatarImgView.layer.masksToBounds = YES;
    [avatarImgView yy_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544000014855&di=01ff2f37062669c071f33ffdacb4c373&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2F8c1001e93901213f10bfab2a51e736d12e2e95bc.jpg"] options:0];
    [self.view addSubview:avatarImgView];
    
    
    CALayer *subLayer = [CALayer layer];
    CGRect subFrame = CGRectMake(CGRectGetMinX(avatarImgView.frame) + 3, CGRectGetMinY(avatarImgView.frame) + 3, CGRectGetWidth(avatarImgView.frame) - 6, CGRectGetHeight(avatarImgView.frame) - 6);
    subLayer.frame = subFrame;
    subLayer.cornerRadius = 8.f;
    subLayer.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5].CGColor;
    subLayer.masksToBounds = NO;
    subLayer.shadowColor = [UIColor blackColor].CGColor;
    subLayer.shadowOffset = CGSizeMake(0, 6.f);
    subLayer.shadowOpacity = 0.8;
    subLayer.shadowRadius = 10.f;
    [self.view.layer insertSublayer:subLayer atIndex:-1];
    avatarImgView.layer.zPosition = 10;
    subLayer.zPosition = 9;
    
}


@end
