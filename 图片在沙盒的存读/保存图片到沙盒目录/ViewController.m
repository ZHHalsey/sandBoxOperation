//
//  ViewController.m
//  保存图片到沙盒目录
//
//  Created by ZZZZZ on 15/11/18.
//  Copyright (c) 2015年 张豪. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 把图片存入沙盒我们 1> 转成NSData类型,然后存入路径
    
    // 需要存入的图片
    UIImage *ZHImage = [UIImage imageNamed:@"bj.png"];
    
    // 把图片转化成NSData类型
    NSData *imageData = UIImagePNGRepresentation(ZHImage);
    
    NSLog(@"iamgeData ---- %@", imageData);
    // 获取沙盒路径, 然后里面的文件的名字是 ZHImage.png
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"ZHImage.png"];
    
    NSLog(@"\n %@ \n", fullPath);
    
    // 把图片转成的NSData类型数据写入我们的沙盒文件夹下
    [imageData writeToFile:fullPath atomically:NO];
    
    [self readImage];
    
}
// 读取照片
- (void)readImage{
    
    // 获得我们保存图片的文件路径 以及 文件的名字.
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"ZHImage.png"];
    
    NSLog(@"fullPath ---- %@", fullPath);
    // 从上面的文件路径中把文件读取出来 然后赋值给我们的按钮的背景颜色
    UIImage *saveImage = [[UIImage alloc]initWithContentsOfFile:fullPath];
    
    // 创建这个btn的用意是为了给这个btn设置背景图片来判断是不是成功吧图片读取出来了
    UIButton *btn = [UIButton buttonWithType:0];
    
    btn.backgroundColor = [UIColor redColor];
    
    btn.frame = CGRectMake(100, 200, 100, 100);
    
    // 用图片作为按钮的背景图
    [btn setBackgroundImage:saveImage forState:UIControlStateNormal];
    
    [self.view addSubview:btn];
    
}
@end
