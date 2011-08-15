//
//  netCon.m
//  FitNexus
//
//  Created by keith on 23/11/2009.
//  Copyright 2009 Keith Loughnane
//

#import "netCon.h"


@implementation netCon
//@synthesize owner;

/*- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}*/

-(int)initWithOwner : (id) iowner
{
        NSLog(@"Initing Netcon");
	owner  = iowner;
    
        serverAdd = @"127.0.0.1";
    
	return 0;
}



-(int)init
// [myAccelGetter initWithOwner:self];	
{
	
	NSLog(@"Trying to connect to %@", serverAdd);
	mySocket =  [[AsyncSocket alloc] initWithDelegate:self];
	if(
	   
	  // NSString *ipAdd = @"192.168.2.4";
       
       
       
	   [mySocket connectToHost:serverAdd onPort:80 error:[NSError alloc]])
		
		
		//NSLog(@"Connected to host %@",ipAdd);
		
		//add sync screen. mod main screen
	{
		NSLog(@"it connected");
		

	}
	//NSString* str= @"hello";
	// This works removed for testing
	//[mySocket readDataWithTimeout:2.0 tag:(long)3.14];
	
	//TODO: a layer of abstraction that can handle the details of handling looing sends and recieves
	
	
	//[mySocket init];
	
	//sleep(10);
	
	
	return 0;
}
-(void) sendData:(NSString *) msg
{
	NSLog(@"send Data called");
	NSLog(@"NetSending \"%@\"",msg);
	
	NSData * d= [msg dataUsingEncoding:NSUTF8StringEncoding];
	//[d initWithBytes: (Byte)@"hello" lenght:5];

	
    if(![mySocket isConnected])
    {
        NSLog(@"Socket not connected Trying Reconnect");
        if([mySocket connectToHost:serverAdd onPort:80 error:[NSError alloc]])
        {
            [owner showMsg:@"Can not connect to server"];
        }
    }
    
    
    [mySocket writeData:d withTimeout:10 tag:(long)2.3];
    
   // [mySocket readDataToData:[AsyncSocket ZeroData] withTimeout:30 tag:0];
    [mySocket readDataWithTimeout:10 tag:0];



}

/*
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }*/

-(void) onSocketDidDisconnect:(AsyncSocket *)sock
{
}

-(void) onSocket: (AsyncSocket *)sock willDisconnectWithError:(NSError *)err
{
	
}
-(void) onSocket:(AsyncSocket *)sock didAcceptNewSocket:(AsyncSocket *)newSocket
{
	//Not used in untill later verions
}
-(void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port
{
	NSLog(@"deligates work");

}
-(void)onSocket:(AsyncSocket *)sock didReadData:(NSData*) data withTag: (long)tag
{
	NSLog(@"recieving data");
	NSString* aStr;
	aStr = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
	//NSLog(@"\n\n\n\n\n\n\n\data recieved: %s",aStr);
    
    [owner recNetMsg:aStr];
    
	NSLog(@"data recieved&: %S",aStr);
	NSLog(@"data recieved*: %@",aStr);
	
}
-(void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag
{
}
- (void)dealloc {
    [super dealloc];
}










@end
