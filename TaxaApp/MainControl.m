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
@synthesize  curLong, curLat, curVerr;

-(int)setMainView:(id *) iMainView
{
    owner = iMainView;
    
    return 0;
}

-(NSString *)getUserID
{
    NSLog(@"About to return user ID");
    NSLog(@"getUserId is returning %@",userID);
    return self.userID;
}


-(int) getPickupID
{
    NSLog(@"Get pickupID returning %d",[myCurrentPickup getID]);
    return [myCurrentPickup getID];
}

-(int) activate
{
        [self sendToNet:[myMsgParser getGetActivate]];
    //self.curLat = locLat;
    //.curLong = locLong;
     [self sendToNet:[myMsgParser getSetPositionMsgllat: self.curLat llong: self.curLong]];
}


-(int)init:(id *) iMainView;
{
    curLat = 1.0;
    curLong = 1.0;
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
    
    [myNetCon init];
   // NSLog([myMsgParser getGetMessage]);
    
    
    

     

    

    
    
    
    
    
    
    NSLog(@"About to send activate to net %@", [myMsgParser getGetActivate]);
   
    

    double loopInterval = 2.0;
    [NSTimer scheduledTimerWithTimeInterval:(loopInterval) target:self selector:@selector(onTimer) userInfo:nil repeats:YES];	
    
    // TESTING ONLY
    
    //--Scenerio Taxi ID 123
    //self.userID = @"123";
    //[mySettingsHandler setMode:1];
    
    //Far
    // [self getsLoc :  :  :::0.0];
    //self.userID = @"123";
   // [mySettingsHandler setMode:0];
    [self activate];
    //[self getsLocLat : 52.308031 LLong:-9.661435 Alt:0.0 LocHacc:0.0 LocVacc:0.0];
    
    //Not as Far
    // [self getsLoc :  52.300626: -9.669943 :0.0:0.0:0.0];
    
    // less than 5 KM
    // [self getsLoc :  52.291207: -9.672432 :0.0:0.0:0.0];
    
    // less than .5 KM
   // [self getsLoc :  52.264812: -9.696929 :0.0:0.0:0.0];
     //[self getsLocLat : 52.264812 LLong:-9.696929 Alt:0.0 LocHacc:0.0 LocVacc:0.0];
    
    //--Scenerio Customer ID 100
    

     
     
    
    
    return 0;
}
- (void)onTimer
{
    NSLog(@"Timer Called");
    
    
    // TESTING ONLY
    
    //--Scenerio Taxi ID 123
    //self.userID = @"100";
    //[mySettingsHandler setMode:0];
    
    //Far
    // [self getsLoc :  :  :::0.0];
    [self activate];
    //[self getsLocLat : 52.264812 LLong:-9.696929 Alt:0.0 LocHacc:0.0 LocVacc:0.0];
  //[self getsLocLat : 52.308031 LLong:-9.661435 Alt:0.0 LocHacc:0.0 LocVacc:0.0];
    
    //Not as Far
   // [self getsLocLat : 52.300626 LLong: -9.669943 Alt:0.0 LocHacc:0.0 LocVacc:0.0];
    // [self getsLoc :  52.300626: -9.669943 :0.0:0.0:0.0];
    
    // less than 5 KM
    //[self getsLocLat : 52.291207 LLong:-9.672432 Alt:0.0 LocHacc:0.0 LocVacc:0.0];
    // [self getsLoc :  52.291207: -9.672432 :0.0:0.0:0.0];
    
    // less than .5 KM
   // [self getsLocLat : 52.264812 LLong:-9.696929 Alt:0.0 LocHacc:0.0 LocVacc:0.0];
    //[self getsLoc :  52.264812: -9.696929 :0.0:0.0:0.0];
    //--Scenerio Customer ID 100
    /*
     self.userID = @"100";
     [mySettingsHandler setMode:0];
     
     */
    
    
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
return 0;
}
-(int)rcvPickupReqID:(int)ID llong:(double)ilong llat:(double)ilat;
{    [self getsLocLat : ilat LLong:ilong Alt:0.0 LocHacc:(double)0.0 LocVacc:0.0];
    NSLog(@"MSTRRECPICKREQ:%d,%f,%f",ID,ilong,ilong);
    
    [myCurrentPickup clear];
    [myCurrentPickup setUpMasterModeID:ID llong:ilong llat:ilat];
    [self askUserConfirmPickup];
    
    
    /* Set up lable */
    
    
    
    
    return 0;
}
-(int) askUserConfirmPickup
{
    [owner recReqPickup:@"Recieved pickup Request Accept?"];
    return 0;
}

    -(int) rcvPickupAccID:(int) iid;
{
     NSLog(@"MSTRRECPICKACC:%d",iid);
    
    [myCurrentPickup setAcceptedClientMode:1];
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
    NSLog(@"Main->ReqPickup %f %f", curLong, self.curLat);
        NSString * tempString = [NSString stringWithFormat:@"%@",[myMsgParser getReqPickupMsg: curLat llong: curLong]];
    
    
    [self sendToNet:tempString];
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
    [owner showMsg:@"Taxi has arrived."];
    
    
    [myCurrentPickup setStatus:-2];
    return 0;
}
-(int) rcvPickupNearID:(int) iid;
{
    NSLog(@"MSTRRECPICKNear:%d",iid);
    //[myCurrentPickup clear];
    [owner showMsg:@"Your Taxi is nearly here."];
    
    return 0;
}

-(int) acceptPickupReq
{
    
    NSLog(@"Accept pickup req called");
    [myCurrentPickup setAcceptedServerMode:1];
    [self sendToNet:[myMsgParser getAccPickupMsg]];
    return 0;
}
     
     -(int) rejectPickupReq
     {
         [self sendToNet:[myMsgParser getRefusePickupMsg]];
         return 0;
     }
    
///server.php?msgtype=getMessages&id=1

-(int) sendToNet:(NSString *)msg
{

    NSLog(@"send to net called");
        NSLog(@"N1");
    NSString * tempString = [NSString stringWithFormat:@"GET %@ HTTP/1.1\nHost: needataxinow.com\nConnection: keep-alive\nUser-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_7) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.742.122 Safari/534.30\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\nAccept-Encoding: gzip,deflate,sdch\nAccept-Language: en-US,en;q=0.8\nAccept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.3\n\n",msg];

    //[tempString alloc];
    NSLog(@"N2");
    NSLog(@"N3");
  //  if ([myNetCon isConnected])
    {
    [myNetCon sendData:tempString];
        NSLog(@"N4");
        return 0;
    }
   /* else
    {
        NSLog(@"4B");
        return -1;
    }*/

}
-(double) getLong
{
    return self.curLong;
 
    
}
-(double) getLat
{
    return self.curLat;


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
    
    //if(([myCurrentPickup getStatus] == -1))
    //{
    self.curLat = locLat;
    self.curLong = locLong;
    self.curVerr = LocVAccuracy;
    [owner getsLoc :  locLat: locLong:locAlt:LocHAccuracy:LocVAccuracy];

    [self sendToNet:[myMsgParser getSetPositionMsgllat: locLat llong: locLong]];
    //}
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
