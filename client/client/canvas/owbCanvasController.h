//
//  owbCanvasViewController.h
//  client
//
//  Created by  tsgsz on 10/10/13.
//  Copyright (c) 2013 tsgsz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "owbCanvas.h"

@interface owbCanvasController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) owbCanvas* canvas;
@end
