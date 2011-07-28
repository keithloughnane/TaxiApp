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
//#import "MainViewController.h"
#import "FlipsideViewController.h"
#import "MessageParser.h"
#import "CurrentPickup.h"
#import "SettingsHandler.h"
#import "MapControl.h"

@interface MainControl : NSObject {
    //DataBaseControler *myDBControler;
    LocationGetter *myLocGetter;
    netCon *myNetCon;
   // MainViewController *myMainViewCon;
    FlipsideViewController * myFlipSideCon;
    MessageParser * myMsgParser;
    CurrentPickup *myCurrentPickup;
    SettingsHandler *mySettingsHandler;
    MapControl *myMapControl;
}

//@property (retain, nonatomic) DataBaseControler *myDBControler;
@property (retain, nonatomic) LocationGetter *myLocGetter;
@property (retain, nonatomic) netCon *myNetCon;
//@property (retain, nonatomic) MainViewController *myMainViewCon;
@property (retain, nonatomic) FlipsideViewController * myFlipSideCon;
@property (retain, nonatomic) MessageParser * myMsgParser;
@property (retain, nonatomic) CurrentPickup *myCurrentPickup;
@property (retain, nonatomic) SettingsHandler *mySettingsHandler;
@property (retain, nonatomic) MapControl *myMapControl;

-(int)init;
-(int) sendToNet:(NSString *)msg;
-(int)rcvPickupReqID:(int)ID llong:(double)ilong llat:(double)ilat;

@end
