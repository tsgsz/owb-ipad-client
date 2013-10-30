//
//  owbCanvas.m
//  client
//
//  Created by  tsgsz on 10/16/13.
//  Copyright (c) 2013 tsgsz. All rights reserved.
//

#import "owbCanvas.h"

@interface owbCanvas (PRIVATE)

@property (nonatomic, strong) UIImage* _background_image;
@property (nonatomic, strong) owbOwbDrawOp* _operation;
@property (nonatomic) BOOL _is_temp_draw;

@end

@implementation owbCanvas

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [self._background_image drawInRect:rect];
    
    if (nil == self._operation) return;
    
    if (self._is_temp_draw) {
        self._is_temp_draw = NO;
        
    }
    
}


@end
