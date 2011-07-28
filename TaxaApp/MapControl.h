//
//  MapControl.h
//  TaxaApp
//
//  Created by keith.loughnane on 21/07/2011.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MapControl : NSObject {
    	id owner;
}
-(int)initWithOwner : (id) owner;
@end
