//
//  AppDelegate.m
//  沙盒目录下地文件夹获取
//
//  Created by ZZZZZ on 15/11/18.
//  Copyright (c) 2015年 张豪. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 获取整个程序所在目录
    NSString *homePath = NSHomeDirectory();
    NSLog(@"\n程序所在目录----%@\n\n\n", homePath);
    
    
    // 获取.app文件目录
    NSString *appPath = [[NSBundle mainBundle] bundlePath];
    NSLog(@"\n.app文件的目录是----%@\n\n\n", appPath);
    
    
    // Documents目录
    NSArray *arr1 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *arr1Path = [arr1 objectAtIndex:0];
    NSLog(@"\nDocuments的目录是----%@\n\n\n", arr1Path);
    
    
    // library目录
    NSArray *arr2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *arr2Path = [arr2 objectAtIndex:0];
    NSLog(@"\nlibrary的目录是----%@\n\n\n", arr2Path);
    
    
    // Caches目录，在Library下面
    NSArray *arr3 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *arr3Path = [arr3 objectAtIndex:0];
    NSLog(@"\nCaches的目录是----%@\n\n\n", arr3Path);
    
    
    // temp目录
    NSString *tmpPath = NSTemporaryDirectory();
    NSLog(@"\ntmpPath的目录是----%@\n\n\n", tmpPath);
    
    
    //用整个程序目录加上tmp就拼凑出tmp目录，其他目录都可这样完成
    NSString *tmpPath_1 = [homePath stringByAppendingPathComponent:@"tmp"];
    NSLog(@"\ntmpPath_1的目录是----%@\n\n\n", tmpPath_1);

    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
