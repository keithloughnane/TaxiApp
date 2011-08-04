//
//  CurrentPickup.m
//  TaxaApp
//
//  Created by keith.loughnane on 21/07/2011.
//  Copyright 2011 none. All rights reserved.
//

#import "CurrentPickup.h"


@implementation CurrentPickup
//@synthesize owner;
-(int)initWithOwner : (id) iowner
{
        NSLog(@"Initing CurrentPickup");
	owner  = iowner;
    
	return 0;
}
-(int) setUpMasterModeID:(int)ID llong:(double)ilong llat:(double)ilat
{
    NSLog(@"setUpMasterMode id = %d long = %f lat = %%f",ID,ilong,ilat);
    pickupId = ID;
    llong = ilong;
    llat = ilat;
    pickupStatus = -1;


    return 0;

}
-(int) getStatus
{
    return pickupStatus;
}
-(int) setStatus:(int)iStatus
{
    pickupId = iStatus;
    return 0;
}

- (int) setUpClientModeID:(int)ID llong:(double)ilong llat:(double)ilat
{
 NSLog(@"setUpMasterMode id = %d long = %f lat = %%f",ID,ilong,ilat);
    pickupId = ID;
    llong = ilong;
    llat = ilat;
    pickupStatus = -1;

return 0;

}

-(double)getLLong
{
    return llong;
}
-(double)getLLat
{
    return llat;
}




-(int) setAcceptedServerMode:(int) iStatus
{
    pickupStatus = iStatus;
    return 0;
    
}

-(int) setAcceptedClientMode:(int) iStatus
{
    pickupStatus = iStatus;
    return 0;
    
}

-(int) clear
{
    
}
@end
