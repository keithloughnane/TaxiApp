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
@synthesize userID;

-(int)setMainView:(id *) iMainView
{
    owner = iMainView;
}

-(NSString *)getUserID
{
    NSLog(@"About to return user ID");
    NSLog(@"getUserId is returning %@",userID);
    return userID;
}


-(int) getPickupID
{
    NSLog(@"Get pickupID returning %d",[myCurrentPickup getID]);
    return [myCurrentPickup getID];
}



-(int)init:(id *) iMainView;
{
    self.userID = [NSString stringWithFormat:@"%@",[[UIDevice currentDevice] uniqueIdentifier]];
    
    
    
    
    
    //userID = [[UIDevice currentDevice] uniqueIdentifier]; //userID;
    
    //userID = [[[NSUserDefaults standardUserDefaults] stringForKey:@"SBFormattedPhoneNumber"] intValue];
    
  //  userID = 0;

   // for(int i = 0; i < [[[UIDevice currentDevice] uniqueIdentifier] length]; i++)
   // {
    NSLog(@"User ID S:%S",userID);
       /* if([[[UIDevice currentDevice] uniqueIdentifier] characterAtIndex:i] < 10)
        {
                userID += [[[UIDevice currentDevice] uniqueIdentifier] characterAtIndex:i]*100;
        }
        else if([[[UIDevice currentDevice] uniqueIdentifier] characterAtIndex:i] < 100)
        {
            userID += [[[UIDevice currentDevice] uniqueIdentifier] characterAtIndex:i]*10;
        }
        else*/
       // userID *= 1000;
           // userID += [[[UIDevice currentDevice] uniqueIdentifier] characterAtIndex:i];

       // NSLog(@"Char = %d",[[[UIDevice currentDevice] uniqueIdentifier] characterAtIndex:i]);
   // NSLog(@"User ID I:%d",userID);

        
        
   // }

   // mode = 0;
	//myDBControler = [DataBaseControler alloc];
	//[myDBControler initWithOwner:self];
    
    NSLog(@"Initing MainControl");
   owner = iMainView;
    
    
    myLocGetter  = [LocationGetter alloc];
    myNetCon = [netCon alloc];
    //myMainViewCon = [MainViewController alloc];
   // myFlipSideCon = [FlipsideViewController alloc];
    myMsgParser = [MessageParser alloc];
    myCurrentPickup = [CurrentPickup alloc];
    mySettingsHandler = [SettingsHandler alloc];
    myMapControl = [MapControl alloc];
    
    [myLocGetter initWithOwner:self];
    [myNetCon initWithOwner:self];
    
    
    [owner initWithOwner:self];
   // [myFlipSideCon initWithOwner:self];
    [myMsgParser initWithOwner:self];
    [myCurrentPickup initWithOwner:self];
    [mySettingsHandler initWithOwner:self];
    [myMapControl initWithOwner:self];
    //[mySettingsHandler SaveOptions];
    [mySettingsHandler LoadOptions];
    //Todo get IP from config and set
    [myNetCon init];
   // NSLog([myMsgParser getGetMessage]);
    
    
    
    // TESTING ONLY
    
     //--Scenerio Taxi ID 123
     self.userID = @"123";
     [mySettingsHandler setMode:1];
     
    //Far
   // [self getsLoc :  :  :::0.0];
    
    [self getsLocLat : 52.308031 LLong:-9.661435 Alt:0.0 LocHacc:0.0 LocVacc:0.0];
    
    //Not as Far
   // [self getsLoc :  52.300626: -9.669943 :0.0:0.0:0.0];
    
    // less than 5 KM
   // [self getsLoc :  52.291207: -9.672432 :0.0:0.0:0.0];
    
    // less than .5 KM
    //[self getsLoc :  52.264812: -9.696929 :0.0:0.0:0.0];
    //--Scenerio Customer ID 100
    /*
     
     self.userID = @"100";
     [mySettingsHandler setMode:0];
     
     */
    

    
    
    
    
    
    
    
   
    
    [self sendToNet:[myMsgParser getGetActivate]];
    double loopInterval = 2.0;
    [NSTimer scheduledTimerWithTimeInterval:(loopInterval) target:self selector:@selector(onTimer) userInfo:nil repeats:YES];	
    


    
    
    return 0;
}
- (void)onTimer
{
    NSLog(@"Timer Called");
    [self sendToNet:[myMsgParser getGetMessage]];
}
-(int) recNetMsg:(NSString*) str;
{
    NSLog(@"Master RCV NET:%@",str);
    [myMsgParser recieveMsg:str];
    return 0;
}
-(int) setMode:(int)iMode
{
    NSLog(@"MainControl setting mode to %d",iMode);
    [mySettingsHandler setMode:iMode];
}
-(int)rcvPickupReqID:(int)ID llong:(double)ilong llat:(double)ilat;
{
    NSLog(@"MSTRRECPICKREQ:%d,%f,%f",ID,ilong,ilong);
    
    [myCurrentPickup clear];
    [myCurrentPickup setUpMasterModeID:ID llong:ilong llat:ilat];
    [self askUserConfirmPickup];
    
    return 0;
}
-(int) askUserConfirmPickup
{
    [owner reqPickup:@"Recieved pickup Request Accept?"];
    return 0;
}

    -(int) rcvPickupAccID:(int) iid;
{
     NSLog(@"MSTRRECPICKACC:%d",iid);
    
    [myCurrentPickup setAcceptedClientMode];
    return 0;
}
    

    -(int) rcvPickupFailID:(int) iid msg:(NSString *) imsg;
{
     NSLog(@"MSTRRECPICKFAIL:%d,%@",iid,imsg);
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    [owner showMsg:imsg];
    
    
    
    //[self informUser:@"Sorry no cab enroute:%@",imsg];
    [myCurrentPickup clear];
    return 0;
}
-(int) reqPickup
{
    NSLog(@"Main->ReqPickup");
        NSString * tempString = [NSString stringWithFormat:@"%@",[myMsgParser getReqPickupMsg]];
    
    
    [self sendToNet:tempString];
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

-(int) acceptPickupReq
{
    NSLog(@"Accept pickup req called");
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
-(double) getLong
{
    return curLong;
    
}
-(double) getLat
{
    return curLat;

}
-(int) getOpMode
{
    return [mySettingsHandler getMode];
}

-(int) getCurPickupID
{
    
    return [myCurrentPickup getID];
}

-(int)getsLocLat : (double)locLat LLong:(double)locLong Alt:(double)locAlt LocHacc:(double)LocHAccuracy LocVacc:(double)LocVAccuracy
{
    NSLog(@"Current Loc->Long:%f  Lat:%f  Alt:%f  HAccuracy:%f   VAccuracy:%f",locLong,locLat,locAlt,LocHAccuracy,LocVAccuracy);
    
    if(!([myCurrentPickup getStatus] == -1))
    {
    curLat = locLat;
    curLong = locLong;
    curVerr = LocVAccuracy;
    	[owner getsLoc :  locLat: locLong:locAlt:LocHAccuracy:LocVAccuracy];
    }
   // [owner upDateLocLong:locLong Lat:locLat Verr:LocVAccuracy];
    
    
    return 0;
}
- (int) showMsg:(NSString *) msg
{
    NSLog(@"Main sending message to main view");
    [owner showMsg:msg];
    return 0;
}


@end
