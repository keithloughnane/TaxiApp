//
//  MapControl.m
//  TaxaApp
//
//  Created by keith.loughnane on 21/07/2011.
//  Copyright 2011 none. All rights reserved.
//

#import "MapControl.h"


@implementation MapControl
//@synthesize owner;
-(int)initWithOwner : (id) iowner
{
    NSLog(@"Initing MapControl");
	owner  = iowner;
    
	return 0;
}
@end
