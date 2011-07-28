//
//  MainControl.m
//  TaxaApp
//
//  Created by keith.loughnane on 21/07/2011.
//  Copyright 2011 none. All rights reserved.
//

#import "MainControl.h"

/*
LocationGetter *myLocGetter;
netCon *myNetCon;
MainViewController *myMainViewCon;
FlipsideViewController * myFlipSideCon;
MessageParser * myMsgParser;
CurrentPickup *myCurrentPickup;
SettingsHandler *mySettingsHandler;
MapControl *myMapControl;

@synthesize myDBControler;
 */

@implementation MainControl

@synthesize myLocGetter;
@synthesize myNetCon;
//@synthesize myMainViewCon;
@synthesize myFlipSideCon;
@synthesize myMsgParser;
@synthesize myCurrentPickup;
@synthesize mySettingsHandler;
@synthesize myMapControl;

-(int)init;
{

	//myDBControler = [DataBaseControler alloc];
	//[myDBControler initWithOwner:self];
    
    NSLog(@"Initing MainControl");

    myLocGetter  = [LocationGetter alloc];
    myNetCon = [netCon alloc];
    //myMainViewCon = [MainViewController alloc];
    myFlipSideCon = [FlipsideViewController alloc];
    myMsgParser = [MessageParser alloc];
    myCurrentPickup = [CurrentPickup alloc];
    mySettingsHandler = [SettingsHandler alloc];
    myMapControl = [MapControl alloc];
    
    [myLocGetter initWithOwner:self];
    [myNetCon initWithOwner:self];
    //[myMainViewCon initWithOwner:self];
    [myFlipSideCon initWithOwner:self];
    [myMsgParser initWithOwner:self];
    [myCurrentPickup initWithOwner:self];
    [mySettingsHandler initWithOwner:self];
    [myMapControl initWithOwner:self];
    [mySettingsHandler LoadOptions];
    //Todo get IP from config and set
    [myNetCon init];
    NSLog([myMsgParser getGetMessage]);
    [self sendToNet:[myMsgParser getGetMessage]];
    
    
    
    return 0;
}
-(int) recNetMsg:(NSString*) str;
{
    NSLog(@"Master RCV NET:%@",str);
    [myMsgParser recieveMsg:str];
    return 0;
}
-(int)rcvPickupReqID:(int)ID llong:(double)ilong llat:(double)ilat;
{
    NSLog(@"MSTRRECPICKREQ:%d,%f,%f",ID,ilong,ilong);
    
    [myCurrentPickup clear];
    [myCurrentPickup setUpMasterModeID:ID llong:ilong llat:ilat];
    [self askUserConfimPickup];
    
    return 0;
}

    -(int) rcvPickupAccID:(int) iid;
{
     NSLog(@"MSTRRECPICKACC:%d",iid);
    
    [myCurrentPickup setAccesptedClientMode];
    return 0;
}
    

    -(int) rcvPickupFailID:(int) iid msg:(NSString *) imsg;
{
     NSLog(@"MSTRRECPICKFAIL:%d,%@",iid,imsg);
    [self informUser:@"Sorry no cab enroute:%@",imsg];
    [myCurrentPickup clear];
    return 0;
}
    

    -(int) rcvPickupCanID:(int) iid;
{
     NSLog(@"MSTRRECPICKCAN:%d",iid); 
    [myCurrentPickup clear];
    [self infromUser:@"Pickup has been canceled"];
    return 0;
}
-(int) rcvPickupArrID:(int) iid;
{
    NSLog(@"MSTRRECPICKArr:%d",iid);
    //[myCurrentPickup clear];
    [self infromUser:@"Your Taxi has arrived."];
    //TODO Vibrate
    return 0;
}
-(int) rcvPickupNearID:(int) iid;
{
    NSLog(@"MSTRRECPICKNear:%d",iid);
    //[myCurrentPickup clear];
    [self infromUser:@"Your Taxi is nearly here."];
     //TODO Vibrate
    return 0;
}
    
///server.php?msgtype=getMessages&id=1

-(int) sendToNet:(NSString *)msg
{

    NSLog(@"send to net called");
        NSLog(@"1");
    NSString * tempString = [NSString stringWithFormat:@"GET %@ HTTP/1.1\nHost: 192.168.2.4\nConnection: keep-alive\nUser-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_7) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.742.122 Safari/534.30\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\nAccept-Encoding: gzip,deflate,sdch\nAccept-Language: en-US,en;q=0.8\nAccept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.3\n\n",msg];

    //[tempString alloc];
    NSLog(@"2");
    NSLog(@"3");
    [myNetCon sendData:tempString];
    NSLog(@"4");
    return 0;
}

@end
