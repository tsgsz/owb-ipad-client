//  KLSingleton.h
//  client
//
//  Created by  tsgsz on 9/22/13.
//  Copyright (c) 2013 tsgsz. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef COMMON_BASE_KLSINGLETON_H_
#define COMMON_BASE_KLSINGLETON_H_

// to use macro singleton, your class must decleare at least two method
// 1 is +(YourClass*) Shared##YourClass and this method you should not implement
// 2 is -(id)RealInit and this method is your real init method, since you should not
// implement the init method.

#define KL_SINGLETON_WITHOUT_ARC(className)                      \
static className * kl_shared_no_arc_##className = nil;           \
+(className *) Shared##className                         \
{                                          \
    return kl_shared_no_arc_##className;                  \
}                                          \
                                           \
+(void ) initialize                                 \
{                                           \
    if([className class] == self) {                       \
        kl_shared_no_arc_##className = [[super allocWithZone:NULL]init]; \
    }                                       \
}                                           \
                                            \
+ (id)allocWithZone:(NSZone *)zone {                          \
    return [self Shared##className];                       \
}                                            \
                                            \
- (id)copyWithZone:(NSZone *)zone {                         \
    return self;                                 \
}                                           \
                                            \
- (id)init {                                     \
    if (nil != kl_shared_no_arc_##className) {                \
        return kl_shared_no_arc_##className;                \
    }                                        \
    self = [super init];                                \
    self = [self RealInit];\
    return self;                                  \
}                                           \
                                            \
- (id)retain {                                     \
    return self;                                   \
}                                           \
                                            \
- (oneway void)release {                                \
}                                               \
                                            \
- (id)autorelease {                                 \
    return self;                                \
}                                           \
                                            \
- (NSUInteger)retainCount {                             \
    return NSUIntegerMax;                               \
}                                           

#define KL_SINGLETON_WITH_ARC(className) \
static className * kl_shared_arc_##className = nil;       \
+(className* ) Shared##className                  \
{                                   \
    __strong static dispatch_once_t kl_predicator;             \
      \
    dispatch_once(&kl_predicator, ^{                \
        kl_shared_arc_##className = [[super allocWithZone:NULL]init]; \
    });                               \
    return kl_shared_arc_##className;             \
}\
                                            \
- (id)init {                                     \
    if (nil != kl_shared_arc_##className) {                \
        return kl_shared_arc_##className;                \
    }                                        \
    self = [super init];                                \
    self = [self RealInit];\
    return self;                                  \
}

#endif //COMMON_BASE_KLSINGLETON_H_