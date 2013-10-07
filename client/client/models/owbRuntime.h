//
//  owbRuntime.h
//  client
//
//  Created by  tsgsz on 10/1/13.
//  Copyright (c) 2013 tsgsz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "owbRuntimeDataManager.h"

@interface owbRuntime : NSObject
@property (nonatomic) BOOL is_login;
@property (nonatomic, strong) owbRuntimeDataManager* data_manager;
+ (owbRuntime*) SharedowbRuntime;
- (BOOL) Login;
- (NSString*) CreateMeeting;
- (void) JoinMeetig:(NSString*) meetingCode;
@end
