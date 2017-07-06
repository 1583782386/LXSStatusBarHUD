//
//  AppDelegate.h
//  LXSStatusBarHUDDemo
//
//  Created by delegate on 2017/7/6.
//  Copyright © 2017年 松. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

