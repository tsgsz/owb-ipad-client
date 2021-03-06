//
//  owbBackGroundViewController.m
//  client
//
//  Created by  tsgsz on 10/7/13.
//  Copyright (c) 2013 tsgsz. All rights reserved.
//

#import "owbBackGroundViewController.h"
#import "owbLoginViewController.h"
#import "owbMenuViewController.h"
#import "owbCommon.h"
#import "owbRuntime.h"
#import "owbMacroBlock.h"

@interface owbBackGroundViewController ()
@property (nonatomic, strong) owbLoginViewController* _login_controller;
@property (nonatomic, strong) UIViewController* _current_view_controller;
@property (nonatomic, strong) owbMenuViewController* _menu_controller;

- (void) _SetFirstView;
@end

@implementation owbBackGroundViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self._login_controller = [[owbLoginViewController alloc]initWithStyle:UITableViewStyleGrouped];
    [self addChildViewController:self._login_controller];
    
    self._menu_controller = [[owbMenuViewController alloc]init];
    [self addChildViewController:self._menu_controller];
    
    [self _SetFirstView];
	
    [owbRuntime SharedowbRuntime].view_controller = self;
    
}

-(void) ShowMenuView
{
    [self transitionFromViewController:self._current_view_controller
            toViewController:self._menu_controller
            duration:OWB_VIEW_ANIMATED_DURATION
            options:UIViewAnimationOptionAllowUserInteraction
            animations:^(){}
            completion:^(BOOL finished){
                self._current_view_controller = self._menu_controller;
    }];
}

-(void) ShowLoginView
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
        BOOL is_login = [[owbRuntime SharedowbRuntime].user_handler Login];
        if (is_login) {
            [self.view addSubview:self._menu_controller.view];
            self._current_view_controller = self._menu_controller;
            return;
        }
    }
    @catch (NSException *exception) {
        ERROR_HUD(exception.reason);
    }
    @finally {
        [self.view addSubview:self._login_controller.view];
        self._current_view_controller = self._login_controller;
    }
}

@end
