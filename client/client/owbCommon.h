//
//  owbCommon.h
//  client
//
//  Created by  tsgsz on 9/16/13.
//  Copyright (c) 2013 tsgsz. All rights reserved.
//

#ifndef client_owbCommon_h
#define client_owbCommon_h

#define OWB_CLIENT_INDENTIFIER @"kingslanding.owb.client"
#define OWB_CELL_IDENTITFILER @"owb.cell"

#define SCREEN_HEIGHT 320
#define SCREEN_WIDTH 640

// the size
#define IPAD_SCREEN_RECT CGRectMake(0,0,SCREEN_HEIGHT,SCREEN_WIDTH)
#define USER_BUTTON_RECT CGRectMake(610,600,60,60)
#define CREATE_BUTTON_RECT CGRectMake(330,600,60,60)
#define JOIN_BUTTON_RECT CGRectMake(470,600,60,60)
#define LOGIN_VIEW_RECT CGRectMake(300,260,30,10)
#define LOGIN_INPUT_RECT CGRectMake(80,10,220,24)
#define LOGIN_BUTTON_RECT CGRectMake(610,600,0,60)
#define MEETING_CODE_RECT CGRectMake(20,10,260,24)

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
#define SUCCESS_IMAGE @"succ.png"
#define ERROR_IMAGE @"error.png"

// the string used in view
#define OWB_CREATE_MEETING @"Create"
#define OWB_JOIN_MEETING @"Join"
#define OWB_ACCOUNT_LABEL @"賬號"
#define OWB_PASSWD_LABEL @"密碼"
#define OWB_LOGIN_NAME_PLACEHOLDER @"請輸入賬號"
#define OWB_LOGIN_PASSWD_PLACEHOLDER @"請輸入密碼"
#define OWB_CREATE_MEETING_ALERT @"會議id"
#define OWB_COPY @"複製"

// the response code
#define OWB_SUC 0
#define OWB_FAIL 1
#define OWB_ERR 2

// the string in hud
#define OWB_NOT_NULL @"賬號和密碼都不能為空"
#define OWB_WRONG_ACCOUNT_OR_PASSWD @"賬號或者密碼錯誤"

#define OWB_VIEW_ANIMATED_DURATION 0.5f

#endif
