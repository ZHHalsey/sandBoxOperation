//
//  ViewController.m
//  沙盒目录 存入字符串
//
//  Created by ZZZZZ on 15/11/12.
//  Copyright (c) 2015年 张豪. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // *** 第一种方法获得沙盒目录
    // 获得沙盒的根路径
    NSString *home = NSHomeDirectory();
    // 获得docement路径
    NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
    NSLog(@"%@", docPath);
    // *****上面的这个方法:沙盒目录下所有的文件都可以找到(Documents，temp，app，libiary) 只不过在后面拼接不同的文件夹的名字就行,用上面的这个方法我们获得别的文件夹比如temp, 只需要拼接上这个temp;
    
    // *****下面的这个方法只是找到了Documents这个文件夹
    // *** 第二种方法获得沙盒目录
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    // 总文件夹下的角标是0的文件夹就是document路径 下面的这个角标0是个定值 不能换 想获取别的 例如libiary的时候也是0,只不过方法换了
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSLog(@"%@", documentsDirectory);
    // ******上面的两个打印结果是相同的
#pragma mark -
    NSDateFormatter *ZHFormatter = [[NSDateFormatter alloc]init];
    
    NSDate *ZHDate = [NSDate date];
    
    // 获取的是iPad真机上的时间字符串
    [ZHFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *_currentTimeStr = [ZHFormatter stringFromDate:ZHDate];
    
    NSLog(@"_currentTimeStr -- %@", _currentTimeStr);
#pragma mark -
    // 将文件写入沙盒目录下地Documents文件夹里面
    NSString *WriteString = @"把我写入到沙盒的Documents文件夹里面去0.00000";
    NSString *filePath = [docPath stringByAppendingPathComponent:[NSString stringWithFormat:@"11111%@.txt", _currentTimeStr]];
    // 把字符串写入我们的Documents文件夹下面
    [WriteString writeToFile:filePath atomically:YES];
    
    
    // 上面的程序运行了3次 写入了3个文件 分别是stringFile.txt, stringFile1.txt, stringFile2.txt
    // 把沙盒里面的文件读取出来 filePath: 档案目录;
    NSString *ReadStr = [[NSString alloc]initWithContentsOfFile:filePath];
    NSLog(@"读出来的字符串 ReadStr---%@", ReadStr);
    // 警告的原因是因为 这个方法太老了 现在苹果公司不推荐使用
    

}

// 下面的这个跟上面的一样 不过是存入的数组
- (void)test{
    /**
     6、写入文件
     
     NSArray  *paths  =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
     
     NSString *docDir = [paths objectAtIndex:0];
     
     if(!docDir) {
     
     NSLog(@"Documents 目录未找到");
     
     }
     
     NSArray *array = [[NSArray alloc] initWithObjects:@"内容",@"content",nil];
     
     NSString *filePath = [docDir stringByAppendingPathComponent:@"testFile.txt"];
     
     [array writeToFile:filePath atomically:YES];
     
     
     7、读取文件
     
     NSArray  *paths  =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
     
     NSString *docDir = [paths objectAtIndex:0];
     
     NSString *filePath = [docDir stringByAppendingPathComponent:@"testFile.txt"];
     
     NSArray *array = [[NSArray alloc] initWithContentsOfFile:filePath];
     
     NSLog(@"%@",array);
     */
}

@end
