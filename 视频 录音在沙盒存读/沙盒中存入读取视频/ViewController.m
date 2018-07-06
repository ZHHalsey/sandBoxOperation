//
//  ViewController.m
//  沙盒中存入读取视频
//
//  Created by ZH on 15/11/27.
//  Copyright (c) 2015年 张豪. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()
{
    MPMoviePlayerViewController *_mpvc;
}

@end
/*
录音的在本地存储跟视频一样,也是先获得录音文件的url, 然后把录音文件转成NSData类型存入我们的沙盒下,等取的时候再 把这个NSData类型的转成url然后播放的时候直接根据这个url就可以进行播放了
 
 */
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    // 把视频存入沙盒里面
    // 需要存入的视频
    NSString *path = [[NSBundle mainBundle]pathForResource:@"被移除的十件神器 还记得杀人甲吗？_lol视频_虎牙视频_1.mp4" ofType:nil];
   
    NSLog(@"path ---- %@", path);
    
    // 获得这个视频的url链接
    NSURL *url = [NSURL fileURLWithPath:path];
    NSLog(@"url ------- %@", url);
    
    // 录取的视频转成NSData类型
    NSData *videoData = [NSData dataWithContentsOfURL:url];
    
    // 获取Documents的路径
    NSString *videoPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"ZHMovie1111.mov"];
    
    // 把我们的NSData类型的数据存入我们的沙盒
    [videoData writeToFile:videoPath atomically:YES];
    
    // 创建一个按钮  点击就从沙盒里面取出来视频
    UIButton *btn = [UIButton buttonWithType:0];
    btn.frame = CGRectMake(100, 200, 100, 40);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"点击取视频" forState:0];
    // 按钮的点击事件就是从沙盒中取出来视频
    [btn addTarget:self action:@selector(ReadMovie) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

// 从沙盒中取视频进行播放
- (void)ReadMovie{
    
    // Movie.mp4:这个是自己起的名字,并不是MP4格式的,只是个名字
    NSString *videoPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"ZHMovie1111.mov"];
    NSLog(@"videoPath --- %@", videoPath);
    
    NSLog(@"fullPath -- %@", videoPath);
    
    // 取得了视频的文件路径
    NSURL *PlayURL = [NSURL fileURLWithPath:videoPath];
    
    _mpvc = [[MPMoviePlayerViewController alloc]initWithContentURL:PlayURL];
    
    [self presentMoviePlayerViewControllerAnimated:_mpvc];
    
    [_mpvc.moviePlayer play];

}













@end
