//
//  LocationGetter.h
//  FitNexus
//
//  Created by keith on 03/09/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationGetter : NSObject
<CLLocationManagerDelegate>{
	id *owner;

	CLLocationManager	*locationManager;	
	CLLocation	*startingPoint;

	
}
//@property (retain, nonatomic) id *owner;
@property (retain, nonatomic) CLLocationManager	*locationManager;
@property (retain, nonatomic) CLLocation *startingPoint;

-(int)initWithOwner : (id) ownerl;

@end
