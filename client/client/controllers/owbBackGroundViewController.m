//
//  owbBackGroundViewController.m
//  client
//
//  Created by  tsgsz on 10/7/13.
//  Copyright (c) 2013 tsgsz. All rights reserved.
//

#import "owbBackGroundViewController.h"
#import "owbLoginViewController.h"
#import "owbCommon.h"
#import "owbRuntime.h"
#import "owbMacroBlock.h"

@interface owbBackGroundViewController ()
@property (nonatomic, strong) owbLoginViewController* _login_controller;
@property (nonatomic, strong) UIViewController* _current_view_controller;

- (void) _ShowLoginView;
- (void) _ShowMenuView;
- (void) _SetFirstView;
@end

@implementation owbBackGroundViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self._login_controller = [[owbLoginViewController alloc]initWithStyle:UITableViewStyleGrouped];
    [self addChildViewController:self._login_controller];
    
    [self _SetFirstView];
	
}

-(void) _ShowMenuView
{

}

-(void) _ShowLoginView
{
    [self transitionFromViewController:self._current_view_controller
            toViewController:self._login_controller
            duration:OWB_VIEW_ANIMATED_DURATION
            options:UIViewAnimationOptionAllowUserInteraction
            animations:^(){}
            completion:^(BOOL finished){
                self._current_view_controller = self._login_controller;
    }];
}

-(void) _SetFirstView
{
    @try {
        BOOL is_login = [[owbRuntime SharedowbRuntime]Login];
        if (is_login) {
            return;
        }
    }
    @catch (NSException *exception) {
        ERROR_HUD(exception.reason);
    }
    @finally {
        [self.view addSubview:self._login_controller.view];
    }
}

@end
