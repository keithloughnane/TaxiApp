//
//  MainControl.h
//  TaxaApp
//
//  Created by keith.loughnane on 21/07/2011.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocationGetter.h"
#import "netCon.h"
#import "FlipsideViewController.h"
#import "MessageParser.h"
#import "CurrentPickup.h"
#import "SettingsHandler.h"
#import "MapControl.h"

@interface MainControl : NSObject {
    
    id owner;
    int mode;//0=cleint; 1=master/taxi
    LocationGetter *myLocGetter;
    netCon *myNetCon;
    FlipsideViewController * myFlipSideCon;
    MessageParser * myMsgParser;
    
    CurrentPickup *myCurrentPickup;
    
    
    
    
    SettingsHandler *mySettingsHandler;
    MapControl *myMapControl;
    
    double curLong, curLat, curVerr;
    
    NSString * userID;
    
}

@property (retain, nonatomic) LocationGetter *myLocGetter;
@property (retain, nonatomic) netCon *myNetCon;
@property (retain, nonatomic) FlipsideViewController * myFlipSideCon;
@property (retain, nonatomic) MessageParser * myMsgParser;
@property (retain, nonatomic) CurrentPickup *myCurrentPickup;
@property (retain, nonatomic) SettingsHandler *mySettingsHandler;
@property (retain, nonatomic) MapControl *myMapControl;
@property  (retain, nonatomic)  NSString * userID;
@property double curLong, curLat, curVerr;

-(int)init:(id *) iMainView;
-(int)setMainView:(id *) iMainView;
-(NSString *)getUserID;
-(int) getPickupID;
-(void)onTimer;
-(int) recNetMsg:(NSString*) str;
-(int) setMode:(int)iMode;
-(int) askUserConfirmPickup;
-(int) rcvPickupAccID:(int) iid;
-(int) rcvPickupFailID:(int) iid msg:(NSString *) imsg;
-(int) reqPickup;
-(int) rcvPickupCanID:(int) iid;
-(int) rcvPickupArrID:(int) iid;
-(int) rcvPickupNearID:(int) iid;
-(int) acceptPickupReq;
-(int) sendToNet:(NSString *)msg;
-(int)rcvPickupReqID:(int)ID llong:(double)ilong llat:(double)ilat;
-(double) getLong;
-(double) getLat;
-(int) getOpMode;
-(int) getCurPickupID;
-(int)getsLocLat : (double)locLat LLong:(double)locLong Alt:(double)locAlt LocHacc:(double)LocHAccuracy LocVacc:(double)LocVAccuracy;
- (int) showMsg:(NSString *) msg;

@end
