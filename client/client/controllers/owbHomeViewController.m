//
//  owbHomeViewController.m
//  client
//
//  Created by  tsgsz on 9/16/13.
//  Copyright (c) 2013 tsgsz. All rights reserved.
//

#import "owbHomeViewController.h"

#import "owbCommon.h"
#import "owbServerProxy.h"
#import "owbLoginViewController.h"
#import "owbMeetingCodeViewController.h"

@interface owbHomeViewController ()
@property (strong, nonatomic) owbLoginViewController* login_controller_;
@property (strong, nonatomic) owbMeetingCodeViewController* meeting_create_controller_;
@property (strong, nonatomic) owbMeetingCodeViewController* meeting_join_controller_;
@property (strong, nonatomic) UIButton* user_button_;
@property (strong, nonatomic) UIButton* create_button_;
@property (strong, nonatomic) UIButton* join_button_;

-(void) _SwitchToCreateMeetingPannel;
-(void) _SwitchToJoinMeetingPannel;
-(void) _ChangeUserState;

@end

@implementation owbHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView
{
    //load server info
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString* server_ip = [defaults stringForKey:@"server_ip"];
    int server_port = [defaults integerForKey:@"server_port"];
    [[owbServerProxy SharedowbServerProxy]BindServerIp:server_ip AndPort:server_port];
    
    //init user
    user_ = [[owbOwbUser alloc]init];
    
    //init view
    self.view = [[UIView alloc]initWithFrame:IPAD_SCREEN_RECT];
    UIColor* bg = [[UIColor alloc]initWithPatternImage:
                [UIImage imageNamed:HOME_VIEW_BACKGROUND_IMAGE]];
    [self.view setBackgroundColor:bg];
    
    //init login view
    self.login_controller_ = [[owbLoginViewController alloc]
                    initWithStyle:UITableViewStyleGrouped];
    [self.view addSubview:self.login_controller_.view];
    [self.login_controller_.view setHidden:YES];
    
    //init create_meeting view
    self.meeting_create_controller_ = [[owbMeetingCodeViewController alloc]
                        initWithStyle:UITableViewStyleGrouped
                        Label:OWB_CREATE_MEETING];
    [self.view addSubview:self.meeting_create_controller_.view];
    [self.meeting_create_controller_.view setHidden:YES];
    
    //init join_meeting view
    self.meeting_join_controller_ = [[owbMeetingCodeViewController alloc]
                        initWithStyle:UITableViewStyleGrouped
                        Label:OWB_JOIN_MEETING];
    [self.view addSubview:self.meeting_join_controller_.view];
    [self.meeting_join_controller_.view setHidden:YES];
    
    //init buttons
    self.user_button_ = [[UIButton alloc]initWithFrame:USER_BUTTON_RECT];
    self.create_button_ = [[UIButton alloc]initWithFrame:CREATE_BUTTON_RECT];
    self.join_button_ = [[UIButton alloc]initWithFrame:JOIN_BUTTON_RECT];
    
    //set buttons background
    [self.user_button_ setBackgroundImage:[UIImage imageNamed:LOGIN_BUTTON]
                        forState:UIControlStateNormal];
    [self.user_button_ setBackgroundImage:[UIImage imageNamed:LOGIN_BUTTON_PRESSED]
                        forState:UIControlStateHighlighted];
    [self.join_button_ setBackgroundImage:[UIImage imageNamed:JOIN_BUTTON]
                        forState:UIControlStateNormal];
    [self.join_button_ setBackgroundImage:[UIImage imageNamed:JOIN_BUTTON_PRESSED]
                        forState:UIControlStateHighlighted];
    [self.create_button_ setBackgroundImage:[UIImage imageNamed:CREATE_BUTTON]
                        forState:UIControlStateNormal];
    [self.create_button_ setBackgroundImage:[UIImage imageNamed:CREATE_BUTTON_PRESSED]
                        forState:UIControlStateHighlighted];
    
    //init target for buttons
    [self.user_button_ addTarget:self action:@selector(_ChangeUserState)
                forControlEvents:UIControlEventTouchUpInside];
    [self.create_button_ addTarget:self action:@selector(_SwitchToCreateMeetingPannel)
                forControlEvents:UIControlEventTouchUpInside];
    [self.join_button_ addTarget:self action:@selector(_SwitchToJoinMeetingPannel)
                forControlEvents:UIControlEventTouchUpInside];
    
    
}



@end
