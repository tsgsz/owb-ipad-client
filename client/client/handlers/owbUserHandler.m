//
//  owbUserHandler.m
//  client
//
//  Created by  tsgsz on 10/8/13.
//  Copyright (c) 2013 tsgsz. All rights reserved.
//

#import "owbUserHandler.h"
#import "owbRuntime.h"
#import "owbServerProxy.h"

@implementation owbUserHandler

-(BOOL)Login
{
    owbRuntime* runtime = [owbRuntime SharedowbRuntime];
    runtime.is_login = [[owbServerProxy SharedowbServerProxy]Login:runtime.user];
    if (runtime.is_login) {
        [runtime SaveUser];
    }
    return runtime.is_login;
}

-(void)Logout
{
    owbRuntime* runtime = [owbRuntime SharedowbRuntime];
    [runtime.meeting_handler DestoryEnv];
    runtime.is_login = NO;
}

@end
