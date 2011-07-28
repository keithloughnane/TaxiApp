//
//  MessageParser.h
//  TaxaApp
//
//  Created by keith.loughnane on 21/07/2011.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MessageParser : NSObject {
    	id owner;
}
-(int)initWithOwner : (id) owner;
-(int)recieveMsg: (NSString *) msg;
-(NSString *) getGetMessage;
@end
