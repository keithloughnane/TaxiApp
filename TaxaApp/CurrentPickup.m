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
@end
