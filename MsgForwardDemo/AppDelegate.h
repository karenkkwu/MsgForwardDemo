//
//  AppDelegate.h
//  MsgForwardDemo
//
//  Created by 吴婷婷 on 2017/11/16.
//  Copyright © 2017年 wutingting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

