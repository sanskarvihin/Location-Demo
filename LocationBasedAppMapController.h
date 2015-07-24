//
//  LocationBasedAppMapController.h
//  LocationBasedAppDemo
//
//  Created by RupakParikh on 26/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import<CoreLocation/CoreLocation.h>
#import<MapKit/MapKit.h>


@interface LocationBasedAppMapController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate> {

	
	MKMapView *aMapView;
	CLLocationManager *aLocationManager;

	
	
}

@property (nonatomic,retain)IBOutlet MKMapView *aMapView;
@property (nonatomic,retain) CLLocationManager *aLocationManager;

@end
