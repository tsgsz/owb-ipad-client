//
//  owbMeetingHandler.m
//  client
//
//  Created by  tsgsz on 10/8/13.
//  Copyright (c) 2013 tsgsz. All rights reserved.
//

#import "owbMeetingHandler.h"
#import "owbServerProxy.h"
#import "owbRuntime.h"
#import "owbHbHandler.h"

@interface owbMeetingHandler (PRIVATE)
@property (nonatomic, strong) owbHbHandler* hb_handler;
@end

@implementation owbMeetingHandler

-(NSString*) CreateMeeting
{
    owbRuntime* runtime = [owbRuntime SharedowbRuntime];
    return [[owbServerProxy SharedowbServerProxy]CreateMeeting:runtime.user.uname];
}

-(void) JoinMeetig:(NSString *)meetingCode
{
    owbRuntime* runtime = [owbRuntime SharedowbRuntime];
    [self DestoryEnv];
    [self InitEnv];
    
    [[owbServerProxy SharedowbServerProxy]JoinMeeting:runtime.user.uname mid:meetingCode];
    
    [runtime.hb_spack setMid:meetingCode];
    [runtime.hb_spack setUname:runtime.user.uname];
    [runtime setCurrent_meeting_id:meetingCode];
}

-(void) InitEnv
{
    _runtime_queue = dispatch_queue_create("owb.kingslanding.meeting_handler._runtime_queue", NULL);
    [self.hb_handler InitEnv];
}

-(void) DestoryEnv
{
    if (nil != _runtime_queue) {
        dispatch_release(_runtime_queue);
    }
    [self.hb_handler DestoryEnv];
}

@end
