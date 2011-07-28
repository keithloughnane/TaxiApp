//
//  MessageParser.m
//  TaxaApp
//
//  Created by keith.loughnane on 21/07/2011.
//  Copyright 2011 none. All rights reserved.
//

#import "MessageParser.h"


@implementation MessageParser
//@synthesize owner;
-(int)initWithOwner : (id) iowner
{
        NSLog(@"Initing MessageParser");
	owner  = iowner;
    
	return 0;
}
-(NSString *) getGetMessage
{
    ///server.php?msgtype=getMessages&id=1

    NSString * msgMsg = [[NSString alloc]initWithFormat:@"/server.php?msgtype=getMessages&id=1"];
    return msgMsg;
}
-(NSString *) getSetPositionMsg
{
    NSString * msgMsg = [[NSString alloc]initWithFormat:@"/server.php?msgtype=setPosition&id=1&llong=123.456&llat=987.654"];
    return msgMsg;
}
-(NSString *) getReqPickupMsg
{
    NSString * msgMsg = [[NSString alloc]initWithFormat:@"/server.php?msgtype=requestPickup&id=1&llong=123.456&llat=987.654"];
    return msgMsg;
}
-(NSString *) getAccPickupMsg
{
    NSString * msgMsg = [[NSString alloc]initWithFormat:@"/server.php?msgtype=acceptPickup&id=1&pickupid=0"];
    return msgMsg;
}
-(NSString *) getRefusePickupMsg
{
    NSString * msgMsg = [[NSString alloc]initWithFormat:@"/server.php?msgtype=refusePickup&id=1&pickupid=0"];
    return msgMsg;
}
-(NSString *) getGetActivate
{
    NSString * msgMsg = [[NSString alloc]initWithFormat:@"/server.php?msgType=activate&id=1"];
    return msgMsg;
}
-(NSString *) getGetDeacitivate
{
    NSString * msgMsg = [[NSString alloc]initWithFormat:@"/server.php?msgType=deActivate&id=1"];
    return msgMsg;
}

-(int)recieveMsg:(NSString *) msg
{
    NSLog(@"Message Parser recieved");
    //NSLog(msg);
    msg = [msg stringByReplacingOccurrencesOfString:@"<br>" withString:@"\n"];
        NSLog(msg);
    NSArray* components = [msg componentsSeparatedByString:@"\n"];
    NSLog(@"breaking string on \\n");
    
    bool startReading = false;
    for(int i = 0; i< [components count]; i++)
    {
        NSLog(@"i = %d",i);
        NSString *tempStr = [components objectAtIndex:i];
        NSLog(tempStr);
        
        //Detect Start and end of message
        if(![tempStr compare:@"MSGSTART"])
        {
            NSLog(@"Found Start");
            startReading = true;
            //break;
        }
        if(![tempStr compare:@"MSGEND"])
        {
            NSLog(@"Found End");
            startReading = false;
           // break;
        }
        
        //Detect Pickup Request
            NSArray* loopComponents = [tempStr componentsSeparatedByString:@":"];
        for(int j = 0; j< [loopComponents count]; j++)
        {
            NSLog(@"%@",[loopComponents objectAtIndex:j]);
        }
        if(startReading)
        { //START MESSAGE READING IF
        if(![[loopComponents objectAtIndex:0] compare:@"PICKREQ"])
        {
            NSLog(@"FIND PRICKREQ");
            //startReading = false;
            //convert lcomp[1&2] to double and pass
            [owner rcvPickupReqID:[[loopComponents objectAtIndex:1] intValue] llong:[[loopComponents objectAtIndex:2] doubleValue] llat: [[loopComponents objectAtIndex:3] doubleValue]];
            
            
            break;
        }
            if(![[loopComponents objectAtIndex:0] compare:@"PICKACC"])
            {
                NSLog(@"FIND PRICKACC");
                //startReading = false;
                //convert lcomp[1&2] to double and pass
                [owner rcvPickupAccID:[[loopComponents objectAtIndex:1] intValue] ];
                
                
                break;
            }
            if(![[loopComponents objectAtIndex:0] compare:@"PICKFAIL"])
            {
                NSLog(@"FIND PRICKFAIL");
                //startReading = false;
                //convert lcomp[1&2] to double and pass
                [owner rcvPickupFailID:[[loopComponents objectAtIndex:1] intValue] msg:[loopComponents objectAtIndex:2]];
                
                
                break;
            }
            if(![[loopComponents objectAtIndex:0] compare:@"PICKCAN"])
            {
                NSLog(@"FIND PRICKCAN");
                //startReading = false;
                //convert lcomp[1&2] to double and pass
                [owner rcvPickupCanID:[[loopComponents objectAtIndex:1] intValue]];
                
                
                break;
            }
            if(![[loopComponents objectAtIndex:0] compare:@"PICKARR"])
            {
                NSLog(@"FIND PRICKARR");
                //startReading = false;
                //convert lcomp[1&2] to double and pass
                [owner rcvPickupArrID:[[loopComponents objectAtIndex:1] intValue]];
                
                
                break;
            }
            if(![[loopComponents objectAtIndex:0] compare:@"PICKNEAR"])
            {
                NSLog(@"FIND PRICKNEAR");
                //startReading = false;
                //convert lcomp[1&2] to double and pass
                [owner rcvPickupNearID:[[loopComponents objectAtIndex:1] intValue]];
                
                
                break;
            }

            //END MESSAGE READING IF
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    //if(![Stype compare:@"LOCLAT"])
    //if(![Stype compare:@"LOCLAT"])
    //if(![Stype compare:@"LOCLAT"])
    //if(![Stype compare:@"LOCLAT"])
    //if(![Stype compare:@"LOCLAT"])
    //if(![Stype compare:@"LOCLAT"])
    //if(![Stype compare:@"LOCLAT"])
    //if(![Stype compare:@"LOCLAT"])
    //if(![Stype compare:@"LOCLAT"])
    //if(![Stype compare:@"LOCLAT"])
    //if(![Stype compare:@"LOCLAT"])
    //if(![Stype compare:@"LOCLAT"])
    //if(![Stype compare:@"LOCLAT"])
    
    
    
    return 0;
}
//if(![Stype compare:@"LOCLAT"])
//{
//}
@end
