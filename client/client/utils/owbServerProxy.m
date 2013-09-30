//
//  owbServerProxy.m
//  client
//
//  Created by  tsgsz on 9/22/13.
//  Copyright (c) 2013 tsgsz. All rights reserved.
//

#import "owbServerProxy.h"
#import "KLSingleton.h"
#import "TSocketClient.h"
#import "TBinaryProtocol.h"

#undef OWB_THIRFT_SERVER
#define OWB_THRIFT_SERVER(server_name, h, p) \
TSocketClient* transport = [[TSocketClient alloc] initWithHostname:h port:p];   \
TBinaryProtocol* protocol = [[TBinaryProtocol alloc] initWithTransport:transport strictRead:YES strictWrite:YES];  \
server_name##Client* client = [[server_name##Client alloc]initWithProtocol:protocol]

@interface owbServerProxy(PRIVATE)
-(void) __BindManagerIp:(NSString*) ip AndPort:(int) port;
-(id) RealInit;

@end

@implementation owbServerProxy


KL_SINGLETON_WITH_ARC(owbServerProxy)

-(id) RealInit
{
    //do nothins
    return self;
}

-(void) BindServerIp:(NSString *)ip AndPort:(int) port
{
    [self __BindManagerIp:ip AndPort:port];
}

-(void) __BindManagerIp:(NSString *)ip AndPort:(int) port
{
    manager_ip_ = ip;
    manager_port_ = port;
}

-(NSMutableArray*) GetOps:(NSString *)mid opid:(int32_t)opid
{
    OWB_THRIFT_SERVER(owbdata_provider, server_info_.ip, server_info_.provider_port);
    return [client GetOps:mid opid:opid];
}

-(NSMutableArray*) Restore:(NSString *)mid
{
    OWB_THRIFT_SERVER(owbdata_provider, server_info_.ip, server_info_.provider_port);
    return [client Restore:mid];
}

-(int32_t) SendOp:(owbOwbOp *)op
{
    OWB_THRIFT_SERVER(owbdata_updater, server_info_.ip, server_info_.updator_port);
    return [client SendOp:op];
}

-(BOOL) TransferAuth:(NSString *)hname mid:(NSString *)mid
{
    OWB_THRIFT_SERVER(owbmaster, server_info_.ip, server_info_.master_port);
    return [client TransferAuth:hname mid:mid];
}

-(NSMutableArray*) GetUserList:(NSString *)mid
{
    OWB_THRIFT_SERVER(owbmaster, server_info_.ip, server_info_.master_port);
    return [client GetUserList:mid];
}

-(owbOwbHbRPack*) HeartBeat:(owbOwbHbSPack *)pack
{
    OWB_THRIFT_SERVER(owbmaster, server_info_.ip, server_info_.master_port);
    return [client HeartBeat:pack];
}

-(BOOL) Login:(owbOwbUser *)user
{
    OWB_THRIFT_SERVER(owbmanager, manager_ip_, manager_port_);
    return [client Login:user];
}

-(void) JoinMeeting:(NSString *)uname passwd:(NSString *)passwd mid:(NSString *)mid
{
    OWB_THRIFT_SERVER(owbmanager, manager_ip_, manager_port_);
    server_info_ = [client JoinMeeting:uname passwd:passwd mid:mid];
}

-(NSString*) CreateMeeting:(NSString *)uname
{
    OWB_THRIFT_SERVER(owbmanager, manager_ip_, manager_port_);
    return [client CreateMeeting:uname];
}

@end
