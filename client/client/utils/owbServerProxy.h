//
//  owbServerProxy.h
//  client
//
//  Created by  tsgsz on 9/22/13.
//  Copyright (c) 2013 tsgsz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "owbservice.h"

@interface owbServerProxy : NSObject
{
@private
    NSString* manager_ip_;
    int manager_port_;
    owbOwbServerInfo* server_info_;
}

-(void) BindServerIp: (NSString*) ip AndPort:(int) port;

+(owbServerProxy*) SharedowbServerProxy;

- (NSMutableArray *) GetOps: (NSString *) mid opid: (int32_t) opid;  // throws TException
- (NSMutableArray *) Restore: (NSString *) mid;  // throws TException

- (int32_t) SendOp: (owbOwbOp *) op;  // throws TException

- (BOOL) TransferAuth: (NSString *) hname mid: (NSString *) mid;  // throws TException
- (NSMutableArray *) GetUserList: (NSString *) mid;  // throws TException
- (owbOwbHbRPack *) HeartBeat: (owbOwbHbSPack *) pack;  // throws TException

- (BOOL) Login: (owbOwbUser *) user;  // throws TException
- (void) JoinMeeting: (NSString *) uname passwd: (NSString *) passwd mid: (NSString *) mid;  // throws owbOwbMissingMeeting *, owbOwbDeadMeeting *, TException
- (NSString *) CreateMeeting: (NSString *) uname;  // throws TException

@end
