//
//  owbHbHandler.h
//  client
//
//  Created by  tsgsz on 10/8/13.
//  Copyright (c) 2013 tsgsz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "owbHandler.h"

@interface owbHbHandler : NSObject<owbHandler> {
@private
    dispatch_queue_t _runtime_queue;
    dispatch_source_t _timer;
}
-(BOOL) StartHb;
-(void) StopHb;
@end
