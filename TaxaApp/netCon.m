//
//  netCon.m
//  FitNexus
//
//  Created by keith on 23/11/2009.
//  Copyright 2009 Keith Loughnane
//

#import "netCon.h"
@implementation netCon

-(int)initWithOwner : (id) iowner
{
    NSLog(@"Initing Netcon");
    owner  = iowner;
    serverAdd = @"needataxinow.com";
    return 0;
}

-(int)init
{
	NSLog(@"Trying to connect to %@", serverAdd);
	mySocket =  [[AsyncSocket alloc] initWithDelegate:self];
	if(
	   [mySocket connectToHost:serverAdd onPort:80 error:[NSError alloc]])
    {
		NSLog(@"it connected");
		
    }
	return 0;
}
-(void) sendData:(NSString *) msg
{
	NSLog(@"send Data called");
	NSLog(@"NetSending \"%@\"",msg);
	NSData * d= [msg dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"Testing socket connection before read write");
    if(![mySocket isConnected])
    {
        NSLog(@"Socket not connected Trying Reconnect");
        if([mySocket connectToHost:serverAdd onPort:80 error:[NSError alloc]])
        {
            [owner showMsg:@"Can not connect to server"];
        }
    }
    else
    {
        NSLog(@"Socket appears connected doing read,write");
        [mySocket writeData:d withTimeout:10 tag:(long)2.3];
        [mySocket readDataWithTimeout:10 tag:0];
    }
}

-(void) onSocketDidDisconnect:(AsyncSocket *)sock
{
}

-(void) onSocket: (AsyncSocket *)sock willDisconnectWithError:(NSError *)err
{
}

-(void) onSocket:(AsyncSocket *)sock didAcceptNewSocket:(AsyncSocket *)newSocket
{
}

-(void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port
{
   // [owner activate];
	NSLog(@"deligates work");
}

-(void)onSocket:(AsyncSocket *)sock didReadData:(NSData*) data withTag: (long)tag
{
	NSLog(@"recieving data");
	NSString* aStr;
	aStr = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    [owner recNetMsg:aStr];
	//NSLog(@"data recieved&: %S",aStr);
	//NSLog(@"data recieved*: %@",aStr);
}

-(void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag
{
}

- (void)dealloc {
    [super dealloc];
}

@end
