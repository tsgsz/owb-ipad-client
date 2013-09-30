//
//  owbCommon.h
//  client
//
//  Created by  tsgsz on 9/16/13.
//  Copyright (c) 2013 tsgsz. All rights reserved.
//

#ifndef client_owbCommon_h
#define client_owbCommon_h

#define SCREEN_HEIGHT 320
#define SCREEN_WIDTH 640

// the size
#define IPAD_SCREEN_RECT CGRectMake(0,0,SCREEN_HEIGHT,SCREEN_WIDTH)
#define USER_BUTTON_RECT CGRectMake(610,600,60,60)
#define CREATE_BUTTON_RECT CGRectMake(330,600,60,60)
#define JOIN_BUTTON_RECT CGRectMake(470,600,60,60)

// the resources name
#define HOME_VIEW_BACKGROUND_IMAGE @"background.jpg"
#define LOGIN_BUTTON @"login1.png"
#define LOGIN_BUTTON_PRESSED @"loginPressed.png"
#define LOGOUT_BUTTON @"logout.png"
#define LOGOUT_BUTTON_PRESSED @"logoutPressed.png"
#define CREATE_BUTTON @"create.png"
#define CREATE_BUTTON_PRESSED @"createPress.png"
#define JOIN_BUTTON @"join.png"
#define JOIN_BUTTON_PRESSED @"joinPressed.png"

// the string used in view
#define OWB_CREATE_MEETING @"Create"
#define OWB_JOIN_MEETING @"Join"

#endif
