//
//  AppDelegate.m
//  EditPDFController
//
//  Created by Damon on 16/3/16.
//  Copyright © 2016年 test. All rights reserved.
//

#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>
@interface AppDelegate ()
{
    AVAudioPlayer *audioPlayer;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    NSThread * thread = [[NSThread alloc] init];
//    thread = [[NSThread alloc] initWithTarget:self selector:@selector(playssssssssss) object:nil];
//    [thread start];
    return YES;
}
//- (void)playssssssssss{
//    NSURL *url=[[NSBundle mainBundle]URLForResource:@"asdf" withExtension:@"mp3"];
//    //1.音频文件的url路径
//    //2.创建播放器（注意：一个AVAudioPlayer只能播放一个url）
//    NSError * error = nil;
//    audioPlayer=[[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
//    NSLog(@"erro :%@  main:%d",error,[NSThread isMainThread]);
//    //3.缓冲
//    [audioPlayer prepareToPlay];
//    //4.播放
//    [audioPlayer play];
//}
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
