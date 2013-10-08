//
//  owbRuntime.h
//  client
//
//  Created by  tsgsz on 10/1/13.
//  Copyright (c) 2013 tsgsz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "owbsys.h"
#import "KeychainItemWrapper.h"
#import "owbUserHandler.h"
#import "owbMeetingHandler.h"
#import "owbHbHandler.h"
#import "owbBackGroundViewController.h"

@interface owbRuntime : NSObject

@property (nonatomic, strong) owbOwbUser* user;
@property (nonatomic, strong) owbOwbHbSPack* hb_spack;
@property (nonatomic) BOOL is_login;
@property (nonatomic, strong) NSString* current_meeting_id;

@property (nonatomic, strong) owbBackGroundViewController* view_controller;

@property (nonatomic, strong) owbUserHandler* user_handler;
@property (nonatomic, strong) owbMeetingHandler* meeting_handler;

+ (owbRuntime*) SharedowbRuntime;
- (void) SaveUser;
- (void) ReInit;
@end
