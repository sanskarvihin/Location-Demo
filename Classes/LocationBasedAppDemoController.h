//
//  LocationBasedAppDemoController.h
//  LocationBasedAppDemo
//
//  Created by RupakParikh on 25/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "LocationBasedAppMapController.h"

@interface LocationBasedAppDemoController : UIViewController <CLLocationManagerDelegate,UITabBarDelegate>{

	CLLocationManager *aLocationManager;
	CLHeading *aHeading;
	UILabel  *aLatLabel,*aLongLabel,*aMHeadingLabel,*aTHeadingLabel,*aCourse,*aSpeed,*aAltitude,*TimesTemp;
	UISwitch *aSwitch;
	UIImageView *aImageView;
	int aFlag;

	
	
}

@property (nonatomic,retain) CLLocationManager *aLocationManager;
@property (nonatomic, retain) IBOutlet UILabel *aLatLabel,*aLongLabel,*aMHeadingLabel,*aTHeadingLabel,*aCourse,*aSpeed,*aAltitude,*TimesTemp;
@property (nonatomic, retain) UISwitch *aSwitch;
@property (nonatomic, retain) IBOutlet UIImageView *aImageView;
@property (nonatomic, retain) CLHeading *aHeading; 



-(IBAction) ButtonAction:(id)sender;
-(void)InitilizeLabel;
@end
