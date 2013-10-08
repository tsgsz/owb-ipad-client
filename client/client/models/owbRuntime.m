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
#import "owbCommon.h"

@interface owbRuntime(PRIVATE)
@property (nonatomic, strong) KeychainItemWrapper* _key_chain;
-(id)RealInit;
@end

@implementation owbRuntime

KL_SINGLETON_WITH_ARC(owbRuntime)

-(id)RealInit
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString* server_ip = [defaults stringForKey:@"server_ip"];
    int server_port = [defaults integerForKey:@"server_port"];
    [[owbServerProxy SharedowbServerProxy]BindServerIp:server_ip AndPort:server_port];
    self.hb_spack = [[owbOwbHbSPack alloc]init];
    self._key_chain = [[KeychainItemWrapper alloc]initWithIdentifier:OWB_CLIENT_INDENTIFIER accessGroup:nil];
    NSString* uname = [self._key_chain objectForKey:kSecAttrAccount];
    NSString* passwd = [self._key_chain objectForKey:kSecValueData];
    self.user = [[owbOwbUser alloc]init];
    [self.user setUname:uname];
    [self.user setPasswd:passwd];
    self.is_login = NO;
    return self;
}

-(void)SaveUser
{
    [self._key_chain setObject:self.user.uname forKey:kSecAttrAccount];
    [self._key_chain setObject:self.user.passwd forKey:kSecAttrAccount];
}

-(void)ReInit
{
    [self.user_handler Logout];
    [self.view_controller ShowLoginView];
}

@end
