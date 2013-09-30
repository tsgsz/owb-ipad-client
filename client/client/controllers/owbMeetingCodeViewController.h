//
//  owbMeetingCodeViewController.h
//  client
//
//  Created by  tsgsz on 9/25/13.
//  Copyright (c) 2013 tsgsz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface owbMeetingCodeViewController : UITableViewController

@property (nonatomic,strong) NSString* mid;

-(id) initWithStyle:(UITableViewStyle)style Label:(NSString*) label;
@end
