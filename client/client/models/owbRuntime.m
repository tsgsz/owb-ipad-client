//
//  owbRuntime.m
//  client
//
//  Created by  tsgsz on 10/1/13.
//  Copyright (c) 2013 tsgsz. All rights reserved.
//

#import "owbRuntime.h"
#import "KLSingleton.h"
#import "owbServerProxy.h"
#import "KeychainItemWrapper.h"
#import "owbCommon.h"

@interface owbRuntime(PRIVATE)

-(id)RealInit;

@property (nonatomic, strong) KeychainItemWrapper* _key_chain;
@property dispatch_queue_t _op_queue;
@property dispatch_queue_t _hb_queue;

@end

@implementation owbRuntime

KL_SINGLETON_WITH_ARC(owbRuntime)

-(id)RealInit
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString* server_ip = [defaults stringForKey:@"server_ip"];
    int server_port = [defaults integerForKey:@"server_port"];
    [[owbServerProxy SharedowbServerProxy]BindServerIp:server_ip AndPort:server_port];
    self.data_manager = [[owbRuntimeDataManager alloc]init];
    self._key_chain = [[KeychainItemWrapper alloc]initWithIdentifier:OWB_CLIENT_INDENTIFIER accessGroup:nil];
    NSString* uname = [self._key_chain objectForKey:kSecAttrAccount];
    NSString* passwd = [self._key_chain objectForKey:kSecValueData];
    [self.data_manager.user setUname:uname];
    [self.data_manager.user setPasswd:passwd];
    self.is_login = NO;
    return self;
}

-(BOOL)Login
{
    self.is_login = [[owbServerProxy SharedowbServerProxy]Login:self.data_manager.user];
    return self.is_login;
}

-(NSString*) CreateMeeting
{
    return [[owbServerProxy SharedowbServerProxy]CreateMeeting:self.data_manager.user.uname];
}

-(void) JoinMeetig:(NSString *)meetingCode
{
    return [owbServerProxy SharedowbServerProxy]JoinMeeting: passwd:<#(NSString *)#> mid:<#(NSString *)#>
}

@end
