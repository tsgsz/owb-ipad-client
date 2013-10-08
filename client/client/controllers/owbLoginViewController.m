//
//  owbLoginViewController.m
//  client
//
//  Created by  tsgsz on 10/7/13.
//  Copyright (c) 2013 tsgsz. All rights reserved.
//

#import "owbLoginViewController.h"
#import "owbCommon.h"
#import "owbRuntime.h"
#import "owbMacroBlock.h"
#import "owbBackGroundViewController.h"

@interface owbLoginViewController (PRIVATE)
@property (nonatomic, strong) NSArray* _labels;
@property (nonatomic, strong) NSArray* _fields;
@property (nonatomic, strong) NSArray* _place_holders;
@property (nonatomic, strong) UITextField* _account_text;
@property (nonatomic, strong) UITextField* _passwd_text;
@property (nonatomic, strong) UIButton* _login_button;

-(BOOL) _Login;

@end

@implementation owbLoginViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        [self.tableView setBackgroundColor:[UIColor clearColor]];
        [self.tableView setScrollEnabled: NO];
        self._labels = @[OWB_ACCOUNT_LABEL, OWB_PASSWD_LABEL];
        self._account_text = [[UITextField alloc]initWithFrame:LOGIN_INPUT_RECT];
        self._account_text.borderStyle = UITextBorderStyleNone;
        self._account_text.returnKeyType = UIReturnKeyNext;
        self._account_text.delegate = self;
        self._account_text.placeholder = OWB_LOGIN_NAME_PLACEHOLDER;
        self._passwd_text = [[UITextField alloc]initWithFrame:LOGIN_INPUT_RECT];
        self._passwd_text.borderStyle = UITextBorderStyleNone;
        self._passwd_text.returnKeyType = UIReturnKeyJoin;
        self._passwd_text.delegate = self;
        self._passwd_text.secureTextEntry = YES;
        self._passwd_text.placeholder = OWB_LOGIN_PASSWD_PLACEHOLDER;
        self._fields = @[self._account_text, self._passwd_text];
        self._login_button = [[UIButton alloc] initWithFrame:LOGIN_BUTTON_RECT];
        [self._login_button setBackgroundImage:[UIImage imageNamed:LOGIN_BUTTON] forState:UIControlStateNormal];
        [self._login_button setBackgroundImage:[UIImage imageNamed:LOGIN_BUTTON_PRESSED] forState:UIControlStateHighlighted];
        [self._login_button addTarget:self action:@selector(_Login) forControlEvents:UIControlEventTouchUpInside];
        
        if ([owbRuntime SharedowbRuntime].user.unameIsSet) {
            self._account_text.text = [owbRuntime SharedowbRuntime].user.uname;
            self._passwd_text.text = [owbRuntime SharedowbRuntime].user.passwd;
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.tableView.frame = LOGIN_VIEW_RECT;
    self.tableView.backgroundView = [[UIView alloc] initWithFrame:self.tableView.bounds];
    self.tableView.backgroundColor = [UIColor clearColor];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self._labels count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:OWB_CELL_IDENTITFILER];
    if (cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:OWB_CELL_IDENTITFILER];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UILabel* label = [[UILabel alloc]initWithFrame:CGRectZero];
        label.tag = indexPath.row;
        label.highlightedTextColor = [UIColor clearColor];
        label.numberOfLines = 0;
        label.opaque = NO;
        label.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:label];
    }
    UILabel* label = (UILabel*)[cell viewWithTag:indexPath.row];
    NSString* title = [self._labels objectAtIndex:indexPath.row];
    CGRect cell_frame = [cell frame];
    cell_frame.origin = CGPointMake(10, 10);
    label.text = title;
    [label setFont:[UIFont fontWithName:@"Helvetica" size:18.0]];
    label.frame = CGRectInset(cell_frame,2,2);
    [label sizeToFit];
    UITextField* field = [self._fields objectAtIndex:indexPath.row];
    [cell.contentView addSubview:field];
    return cell;
}

-(BOOL) shouldAutorotate
{
    return self.interfaceOrientation == UIInterfaceOrientationLandscapeRight;
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    BOOL rcode = YES;
    if (textField == self._passwd_text) {
        rcode = [self _Login];
    }
    [self._passwd_text resignFirstResponder];
    return rcode;
}

-(BOOL) _Login{

    BOOL rcode = NO;
    
    if (nil == self._account_text.text || nil == self._passwd_text.text) {
        ERROR_HUD(OWB_NOT_NULL);
    } else {
        [[owbRuntime SharedowbRuntime].user setUname:self._account_text.text];
        [[owbRuntime SharedowbRuntime].user setPasswd:self._passwd_text.text];
        @try {
            rcode = [[owbRuntime SharedowbRuntime].user_handler Login];
            if (!rcode) {
                FAIL_HUD(OWB_WRONG_ACCOUNT_OR_PASSWD);
            } else {
                owbBackGroundViewController* back = (owbBackGroundViewController*) self.parentViewController;
                [back ShowMenuView];
            }
        }
        @catch (NSException *exception) {
            ERROR_HUD(exception.reason);
        }
    }
    return rcode;
}

@end
