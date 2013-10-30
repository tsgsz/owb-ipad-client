//
//  owbCanvasViewController.m
//  client
//
//  Created by  tsgsz on 10/10/13.
//  Copyright (c) 2013 tsgsz. All rights reserved.
//

#import "owbCanvasController.h"
#import "owbCommon.h"
#import "owbRuntime.h"

@interface owbCanvasController ()

@end

@implementation owbCanvasController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UIScrollView* sv= [[UIScrollView alloc]initWithFrame:IPAD_SCREEN_RECT];
        self.view = sv;
        sv.delegate = self;
        sv.contentSize = CANVAS_SIZE;
        sv.backgroundColor = [UIColor clearColor];
        sv.showsHorizontalScrollIndicator = YES;
        sv.showsVerticalScrollIndicator = YES;
        sv.minimumZoomScale = MIN_ZOOM_SCALE;
        sv.maximumZoomScale = MAX_ZOOM_SCALE;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.canvas = [[owbCanvas alloc]init];
    [self.view addSubview:self.canvas];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) scrollViewDidZoom:(UIScrollView *)scrollView {
    UIScrollView* sv = (UIScrollView*) self.view;
    [[owbRuntime SharedowbRuntime] setZoom_scale:sv.zoomScale];
}

- (UIView*) viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.canvas;
}

@end
