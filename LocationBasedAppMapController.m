//
//  LocationBasedAppMapController.m
//  LocationBasedAppDemo
//
//  Created by RupakParikh on 26/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LocationBasedAppMapController.h"


@implementation LocationBasedAppMapController

@synthesize aMapView,aLocationManager;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	self.aLocationManager=[[CLLocationManager alloc]init];
	self.aLocationManager.delegate=self;
	self.aLocationManager.desiredAccuracy=kCLLocationAccuracyBest;;
	self.aLocationManager.distanceFilter=0.5f;
	
 	
	[self.aLocationManager startUpdatingLocation];
	
	[super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[aLocationManager release];
	[aMapView release];
    [super dealloc];
}

#pragma mark
#pragma mark CLLocationManager Methods

- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation{
	
	
	MKCoordinateRegion aRegion;
	aRegion.center.latitude=newLocation.coordinate.latitude;
	NSLog(@"%f",newLocation.coordinate.latitude);
	aRegion.center.longitude=newLocation.coordinate.longitude;
	aRegion.span.latitudeDelta=0.0039;
	aRegion.span.longitudeDelta=0.0034;
	self.aMapView.region=aRegion;
	
	[super viewDidLoad];
	
	
}	


-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
	
	
	// Respond to the (rare) location manager failure
	NSLog(@"Location manager error: %@", [error description]); 
	CLLocation *simulatorLocation = [[CLLocation alloc] initWithLatitude:37.33168900 longitude:-122.03073100];
    [self locationManager:aLocationManager didUpdateToLocation:simulatorLocation fromLocation:nil];
    [simulatorLocation release];
	
	
	return;
	
}
@end
