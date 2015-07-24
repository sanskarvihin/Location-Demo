//
//  LocationBasedAppDemoAppDelegate.h
//  LocationBasedAppDemo
//
//  Created by RupakParikh on 25/08/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationBasedAppDemoController.h"



@interface LocationBasedAppDemoAppDelegate : NSObject <UIApplicationDelegate,UITabBarControllerDelegate>{
    UIWindow *window;
	LocationBasedAppDemoController *aLocationBasedAppDemoConntroller;
	UITabBarController *aTabController;

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic,retain) LocationBasedAppDemoController *aLocationBasedAppDemoConntroller;
@property (nonatomic, retain) IBOutlet UITabBarController *aTabController;
@end

