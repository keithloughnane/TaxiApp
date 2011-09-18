//
//  LocationGetter.m
//  FitNexus
//
//  Created by keith on 03/09/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "LocationGetter.h"

@implementation LocationGetter
@synthesize locationManager;
@synthesize startingPoint;

-(int)initWithOwner : (id) ownerl
{
    NSLog(@"Initing LocationGetter");
    
	owner = (id)ownerl;
	self.locationManager = [[CLLocationManager alloc] init];	
	locationManager.delegate = self;
	locationManager.distanceFilter = kCLDistanceFilterNone; 
	locationManager.desiredAccuracy = kCLLocationAccuracyBest;
	[locationManager startUpdatingLocation];
	
	NSLog(@"Accel Loaded");
	return 0;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation 
{
    NSLog(@"didUpdateLoc called");
    self.startingPoint = newLocation;
	double dlong,dlat,dalt,dHerror,dVerror;
	dlong = (double)newLocation.coordinate.longitude;
	dlat =  (double)newLocation.coordinate.latitude;
	dalt = (double)newLocation.altitude;
	dHerror =  (double)newLocation.horizontalAccuracy;
	dVerror = (double)newLocation.verticalAccuracy;
	[owner getsLoc :  dlat: dlong:dalt:dHerror:dVerror];
}

@end
