//
//  ViewController.m
//  沙盒Documents里面创建文件夹
//
//  Created by ZZZZZ on 15/11/25.
//  Copyright (c) 2015年 张豪. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 获得沙盒的根路径
    NSString *home = NSHomeDirectory();
    // 获得docement路径
    NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
    NSLog(@"--- %@", docPath);
    [self creataFile];

}
// 在Documents里面创建了两个文件夹
- (void)creataFile{
    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSString *pathDocuments = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *createPath = [NSString stringWithFormat:@"%@/Image", pathDocuments];
    NSString *createDir = [NSString stringWithFormat:@"%@/MessageQueueImage", pathDocuments];
    
    // 判断文件夹是否存在，如果不存在，则创建
    if (![[NSFileManager defaultManager] fileExistsAtPath:createPath]) {
        [fileManager createDirectoryAtPath:createPath withIntermediateDirectories:YES attributes:nil error:nil];
        [fileManager createDirectoryAtPath:createDir withIntermediateDirectories:YES attributes:nil error:nil];
    } else {
        NSLog(@"FileDir is exists.");
    }
}

@end
