//
//  NSArray+Hook.m
//  hookCrash
//
//  Created by zhs on 2017/8/7.
//  Copyright © 2017年 zhs. All rights reserved.
//

#import "NSArray+Hook.h"
#import <objc/runtime.h>
@implementation NSArray (Hook)

- (void)swizzleMethod:(SEL)origSelector withMethod:(SEL)newSelector
{
    Class class = [self class];
    
    Method originalMethod = class_getInstanceMethod(class, origSelector);
    Method swizzledMethod = class_getInstanceMethod(class, newSelector);
    
    BOOL didAddMethod = class_addMethod(class,
                                        origSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class,
                            newSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        id obj = [[self alloc] init];
        [obj swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(safe_objectAtIndex:)];
        
    });
}

- (instancetype)safe_objectAtIndex:(NSUInteger)index {
    if (index <= self.count - 1) {
      return [self safe_objectAtIndex:index];
    }else {
        NSLog(@"数组越界了!");
        return self;
    }
    
}

@end
