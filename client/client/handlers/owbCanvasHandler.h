//
//  owbCanvasHandler.h
//  client
//
//  Created by  tsgsz on 10/14/13.
//  Copyright (c) 2013 tsgsz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "owbHandler.h"

@interface owbCanvasHandler : NSObject<owbHandler>
{
@private
    dispatch_queue_t _drawing_queue;
}
@end
