//
//  SettingsHandler.h
//  TaxaApp
//
//  Created by keith.loughnane on 21/07/2011.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#define optionsFilename @"config.plist"

@interface SettingsHandler : NSObject {
    id owner;

    int mode;
}

    

-(int)initWithOwner : (id) owner;
- (NSString *) optionsFilePath;
-(int)SaveOptions;
-(int)LoadOptions;
@end
