//
//  LocationBasedAppDemoController.m
//  LocationBasedAppDemo
//
//  Created by RupakParikh on 25/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LocationBasedAppDemoController.h"



@implementation LocationBasedAppDemoController
@synthesize  aLatLabel,aLongLabel,aMHeadingLabel,aTHeadingLabel,aCourse,aSpeed,aAltitude,TimesTemp,aLocationManager;
@synthesize aSwitch,aImageView,aHeading;
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
	
		
	aFlag=0;
	
		
	[self.view setFrame:CGRectMake(0, 0, 320, 480)];
	
	if (!self.aLocationManager.locationServicesEnabled) {
		
		NSLog(@"User has opted out of location services"); 
		//return;
	}
	
	self.aLocationManager=[[CLLocationManager alloc]init];
	self.aLocationManager.delegate=self;
	self.aLocationManager.desiredAccuracy=kCLLocationAccuracyBest;;
	self.aLocationManager.distanceFilter=0.5f;
	
 	[self InitilizeLabel];
	[self.aLocationManager startUpdatingLocation];
	[self.aLocationManager startUpdatingHeading];
	
	//LocationBasedAppMapController *aMapViewController=[[LocationBasedAppMapController alloc]initWithNibName:LocationBasedAppMapController bundle:nil]
	//self.aMapView=aMapViewController;
	//[aMapViewController release];
	[super viewDidLoad];
}
-(void)InitilizeLabel
{
	self.aLatLabel.text=@"";
	self.aLongLabel.text=@"";
	self.aCourse.text=@"";
	self.aTHeadingLabel.text=@"";
	self.aMHeadingLabel.text=@"";
	self.aSpeed.text=@"";
	self.TimesTemp.text=@"";
	self.aAltitude.text=@"";
	
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
	
	
	
	[aHeading release];
	[aImageView release];
	[aSwitch release];
	[aLatLabel release];
	[aLongLabel release];
	[aMHeadingLabel release];
	[aTHeadingLabel release];
	[aCourse release];
	[aSpeed release];
	[aAltitude release];
	[TimesTemp release];
	[aLocationManager release];
    [super dealloc];
}

#pragma mark 
#pragma mark Button Action
-(IBAction) ButtonAction:(id)sender{
	NSLog(@"Button");
	if(aFlag==0)
	{
		self.aLatLabel.text=@"";
		self.aLongLabel.text=@"";
		self.aCourse.text=@"";
		self.aTHeadingLabel.text=@"";
		self.aMHeadingLabel.text=@"";
		self.aSpeed.text=@"";
		self.TimesTemp.text=@"";
		self.aAltitude.text=@"";
		aFlag=1;
	}
	else  if(aFlag==1){
		aFlag=0;
		[self viewDidLoad];
		
	}
	
	
	
}

#pragma mark
#pragma mark CLLocationManager Methods

- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation{
	
	
	
	
	
	// Output a summary of the current location result 
	NSLog(@"Location Description::%@\n", [newLocation description]);
	self.aLatLabel.text=[NSString stringWithFormat:@"%0.3f",
						 newLocation.coordinate.latitude];
	
	self.aLongLabel.text=[NSString stringWithFormat:@"%0.3f",
						  newLocation.coordinate.longitude];
	
	
	
	
	
	
	self.aSpeed.text=[NSString stringWithFormat:@"%0.3f",
					  newLocation.speed];
	
	self.aCourse.text=[NSString stringWithFormat:@"%0.3f",
					   newLocation.course];
	
	self.aAltitude.text=[NSString stringWithFormat:@"%0.3f",
						 newLocation.altitude];
	
	
	NSDateFormatter *timestampformatter = [[NSDateFormatter alloc] init];
	[timestampformatter setDateFormat:@"HH:mm:ss"];
	
	self.TimesTemp.text=[timestampformatter stringFromDate:newLocation.timestamp];	
	
	[timestampformatter release];
	
}
- (void)locationManager:(CLLocationManager *)manager
       didUpdateHeading:(CLHeading *)newHeading{
	self.aTHeadingLabel.text=[NSString stringWithFormat:@"%0.3f",
							  newHeading.trueHeading];
	
	self.aMHeadingLabel.text=[NSString stringWithFormat:@"%0.3f",
							  newHeading.magneticHeading];
	
	
}


-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
	
	// Respond to the (rare) location manager failure
	NSLog(@"Location manager error: %@", [error description]); 
	CLLocation *simulatorLocation = [[CLLocation alloc] initWithLatitude:37.33168900 longitude:-122.03073100];
    [self locationManager:aLocationManager didUpdateToLocation:simulatorLocation fromLocation:nil];
    [simulatorLocation release];
	
	
	return;
	
	
}

- (BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager *)manager{
	
	return YES;
}






@end
