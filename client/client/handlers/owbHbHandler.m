//
//  owbHbHandler.m
//  client
//
//  Created by  tsgsz on 10/8/13.
//  Copyright (c) 2013 tsgsz. All rights reserved.
//

#import "owbHbHandler.h"
#import "owbServerProxy.h"
#import "owbCommon.h"
#import "owbMacroBlock.h"
#import "owbRuntime.h"

@interface owbHbHandler (PRIVATE)
@property (nonatomic) BOOL _is_running;
@property (nonatomic) int _fail_time;
@property (nonatomic) BOOL _is_success;
-(void)_HeartBeat;
@end

@implementation owbHbHandler

-(void) InitEnv
{
    self._fail_time = 0;
    self._is_success = NO;
    _runtime_queue = dispatch_queue_create("kingslanding.owb.hb_handler._runtime_queue", NULL);
}

-(void) DestoryEnv
{
    [self StopHb];
    if (nil != _runtime_queue) {
        dispatch_release(_runtime_queue);
    }
}

-(BOOL) StartHb
{
    if (self._is_running) {
        return YES;
    }
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, _runtime_queue);
    
    if (nil == _timer) {
        return NO;
    }
    
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), OWB_HB_INTERVAL, 0);
    dispatch_source_set_event_handler(_timer, ^(void){[self _HeartBeat];});
    
    self._is_running = YES;
    
    return YES;
}

-(void) StopHb
{
    if (!self._is_running) {
        return;
    }
    dispatch_source_cancel(_timer);
    dispatch_release(_timer);
    self._is_running = NO;
}

-(void) _HeartBeat
{
    owbRuntime* runtime = [owbRuntime SharedowbRuntime];
    @try {
        owbOwbHbRPack* rpack = [[owbServerProxy SharedowbServerProxy]HeartBeat:runtime.hb_spack];
        
        [runtime.user setIdentity:rpack.identity];
        if (!self._is_success) self._fail_time = 0;
        self._is_success = YES;
    }
    @catch (NSException *exception) {
        self._is_success = NO;
        self._fail_time ++;
        if (self._fail_time >= OWB_HB_MAX_FAIL) {
            ERROR_HUD(exception.reason);
            [runtime ReInit];
        }
    }
    
}



@end
