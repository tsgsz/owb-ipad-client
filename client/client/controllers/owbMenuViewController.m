//
//  owbMenuViewController.m
//  client
//
//  Created by  tsgsz on 10/7/13.
//  Copyright (c) 2013 tsgsz. All rights reserved.
//

#import "owbMenuViewController.h"
#import "owbCommon.h"
#import "owbRuntime.h"
#import "owbMacroBlock.h"

@interface owbMenuViewController (PRIVATE)

-(void) _CreateMeeting;
-(void) _JoinMeeting;

@property (nonatomic, strong) UIButton* _create_meeting_button;
@property (nonatomic, strong) UIButton* _join_meeting_button;
@property (nonatomic, strong) UITextField* _meeting_code_field;
@end

@implementation owbMenuViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self._meeting_code_field = [[UITextField alloc] initWithFrame:MEETING_CODE_RECT];
    [self._meeting_code_field setBorderStyle:UITextBorderStyleNone];
    self._meeting_code_field.returnKeyType = UIReturnKeyDone;
    
    self._create_meeting_button = [[UIButton alloc]initWithFrame:CREATE_BUTTON_RECT];
    self._join_meeting_button = [[UIButton alloc]initWithFrame:JOIN_BUTTON_RECT];
    
    [self._create_meeting_button setBackgroundImage:[UIImage imageNamed:CREATE_BUTTON] forState:UIControlStateNormal];
    
    [self._join_meeting_button setBackgroundImage:[UIImage imageNamed:JOIN_BUTTON] forState:UIControlStateNormal];
    
    [self._create_meeting_button setBackgroundImage:[UIImage imageNamed:CREATE_BUTTON_PRESSED] forState:UIControlStateHighlighted];
    
    [self._join_meeting_button setBackgroundImage:[UIImage imageNamed:JOIN_BUTTON_PRESSED] forState:UIControlStateHighlighted];
    
    [self._create_meeting_button addTarget:self action:@selector(_CreateMeeting) forControlEvents:UIControlEventTouchUpInside];
    
    [self._join_meeting_button addTarget:self action:@selector(_JoinMeeting) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void) _CreateMeeting
{
    @try {
        NSString* meeting_code = [[owbRuntime SharedowbRuntime].meeting_handler CreateMeeting];
        [UIPasteboard generalPasteboard].string = meeting_code;
        UIAlertView* code_view = [[UIAlertView alloc]initWithTitle:OWB_CREATE_MEETING_ALERT message:meeting_code delegate:self cancelButtonTitle:OWB_COPY otherButtonTitles:nil, nil];
        [code_view show];
    }
    @catch (NSException *exception) {
        ERROR_HUD(exception.reason);
    }
}

-(void) _JoinMeeting
{
    
}

@end
