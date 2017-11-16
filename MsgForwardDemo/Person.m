//
//  Person.m
//  MsgForwardDemo
//
//  Created by 吴婷婷 on 2017/11/16.
//  Copyright © 2017年 wutingting. All rights reserved.
//

#import "Person.h"
#import "Car.h"
#import <objc/runtime.h>

@implementation Person

void run(id self,SEL _cmd) {
    NSLog(@"%@ %s",self,sel_getName(_cmd));
}
/*=============STEP 1===================*/
//当实例对象方法不存在时调用
+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    if (sel == @selector(run)) {
//        class_addMethod(self, sel, (IMP)run, "v@:");
//        return YES;
//    }
    return [super resolveInstanceMethod:sel];
}

//当类方法不存在时调用
+ (BOOL)resolveClassMethod:(SEL)sel {
    return [super resolveClassMethod:sel];
}

/*=============STEP 2===================*/
- (id)forwardingTargetForSelector:(SEL)aSelector {
//    return [[Car alloc] init];
    return self;
}

/*=============STEP 3===================*/
-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    
    NSString *sel = NSStringFromSelector(aSelector);
    
    if ([sel isEqualToString:@"run"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    SEL selector = [anInvocation selector];
    
    Car *car = [[Car alloc] init];
    
    if ([car respondsToSelector:selector]) {
        [anInvocation invokeWithTarget:car];
    }
}
@end
