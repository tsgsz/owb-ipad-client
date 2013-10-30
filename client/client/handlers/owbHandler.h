//
//  owbHandler.h
//  client
//
//  Created by  tsgsz on 10/9/13.
//  Copyright (c) 2013 tsgsz. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol owbHandler <NSObject>
@optional
-(void) InitEnv;
-(void) DestoryEnv;
@end
