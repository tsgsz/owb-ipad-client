//
//  owbMacroBlock.h
//  client
//
//  Created by  tsgsz on 10/1/13.
//  Copyright (c) 2013 tsgsz. All rights reserved.
//

#ifndef client_owbMacroBlock_h
#define client_owbMacroBlock_h

#import "MBProgressHUD.h"
#import "owbCommon.h"

#define SUCCESS_HUD(hint) \
MBProgressHUD* hud = [MBProgressHUD \
            showHUDAddedTo:[[[UIApplication sharedApplication]windows]lastObject] \
            animated:YES]; \
hud.customView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:SUCCESS_IMAGE]]; \
hud.mode = MBProgressHUDModeCustomView; \
hud.labelText = (hint);         \
[hud show: YES];        \
[hud hide:YES afterDelay:1]

#define ERROR_HUD(hint) \
MBProgressHUD* hud = [MBProgressHUD \
            showHUDAddedTo:[[[UIApplication sharedApplication]windows]lastObject] \
            animated:YES]; \
hud.customView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:ERROR_IMAGE]]; \
hud.mode = MBProgressHUDModeCustomView; \
hud.labelText = (hint);         \
[hud show: YES];        \
[hud hide:YES afterDelay:1]

#define FAIL_HUD(hint) \
MBProgressHUD* hud = [MBProgressHUD \
            showHUDAddedTo:[[[UIApplication sharedApplication]windows]lastObject] \
            animated:YES]; \
hud.customView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:ERROR_IMAGE]]; \
hud.mode = MBProgressHUDModeCustomView; \
hud.labelText = (hint);         \
[hud show: YES];        \
[hud hide:YES afterDelay:1]

#endif
