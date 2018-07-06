//
//  ViewController.m
//  在线音乐保存到沙盒
//
//  Created by ZZZZZ on 15/11/23.
//  Copyright (c) 2015年 张豪. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     // 现实把音乐转成NSData格式
     NSData *mp3Data = [[NSData alloc] initWithContentsOfURL:url];
     
     // 获取沙盒路径
     NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent: @"Documents/xxx.mp3"];
     
     // 然后把这个NSData格式写入我们的文件路径
     [mp3Data writeToFile:filePath];
     
     // 然后我们在读取出来就可以了
     
     播放：
     player = [[AVAudioPlayer alloc] initWithContentsOfURL: [NSURL fileURLWithPath:filePath] error: nil];
     [player play];
     */
}

@end
