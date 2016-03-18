//
//  BootLogic.m
//  TechmasterApp
//
//  Created by techmaster on 9/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "BootLogic.h"
#import "MainScreen.h"


@implementation BootLogic
+ (void) boot: (UIWindow*) window
{
    MainScreen* mainScreen = [[MainScreen alloc] initWithStyle:UITableViewStyleGrouped];
    //--------- From this line, please customize your menu data -----------

    NSDictionary* UIGestureRecognizer = @{SECTION: @"UIGestureRecognizer", MENU: @[
                                                  @{TITLE: @"Tap", CLASS: @"Tap"},
                                                  @{TITLE: @"Pan", CLASS: @"Pan"},
                                                  @{TITLE: @"Pinch and Rotate", CLASS: @"Pinch"},
                                                  ]};

    
    mainScreen.menu = @[UIGestureRecognizer];
    mainScreen.title = @"Bootstrap App";
    mainScreen.about = @"This is demo bootstrap demo app. It is collection of sample code of AVFoundation";
    
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController: mainScreen];
    
    window.rootViewController = nav;
}
@end
