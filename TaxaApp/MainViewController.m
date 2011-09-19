//
//  MainViewController.m
//  TaxaApp
//
//  Created by keith.loughnane on 21/07/2011.
//  Copyright 2011 none. All rights reserved.
//

#import "MainViewController.h"


@implementation MainViewController;
@synthesize managedObjectContext=_managedObjectContext;
@synthesize myMap;
@synthesize myMain;
@synthesize myTextView;
@synthesize btnAcc;
@synthesize btnCan;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
-(int)initWithOwner : (id) iowner
{
    NSLog(@"seting owner in MainView");
	owner  = iowner;
	return 0;
}

- (void)viewDidLoad
{
    
    NSLog(@"seting owner in MainView");
    mode = 0;
    [myTextView setText:@"Test"];
    myMain  = [[MainControl alloc] init:self];
    [myMain setMainView:self];
    
    location.latitude = 0.0;
	location.longitude = 0.0;	
	[myMap setCenterCoordinate:location];
	MKCoordinateRegion region;
    MKCoordinateSpan span;
    region.center=myMap.region.center;
	
	span.latitudeDelta=myMap.region.span.latitudeDelta /20000.0002;
	span.longitudeDelta=myMap.region.span.longitudeDelta /20000.0002;
	region.span=span;
	[myMap setRegion:region animated:TRUE];	
    [myMap setCenterCoordinate:location];
    [self setPin];

    [self showInfo:self];
    [super viewDidLoad];
}

-(int)getsLoc : (double) locLat: (double) locLong : (double) locAlt: (double) LocHAccuracy :  (double) LocVAccuracy
{
    NSLog(@"Main view Current Loc->Long:%f  Lat:%f  Alt:%f  HAccuracy:%f   VAccuracy:%f",locLong,locLat,locAlt,LocHAccuracy,LocVAccuracy);
	NSLog(@"GETS LOC METHOD CALLED %f, %f",locLat,locLong);
    [self upDateLocLong:locLong Lat:locLat Verr:0.0];
    
	return 0;
}

-(int) setPin
{
    MKPlacemark *pickPlace = [[MKPlacemark alloc]initWithCoordinate:location addressDictionary:[[NSDictionary alloc] init]];
	[myMap addAnnotation:pickPlace];
}

- (int) upDateLocLong:(double) locLong Lat:(double)locLat Verr:(double)LocVAccuracy
{
    NSLog(@"- (int) upDateLocLong:(double) %f Lat:(double)%f Verr:(double)LocVAccuracy",locLong,locLat);
    location.latitude = locLat;
	location.longitude = locLong;	
	[myMap setCenterCoordinate:location];
	
    
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    region.center=myMap.region.center;
	
	span.latitudeDelta=myMap.region.span.latitudeDelta /20000.0002;
	span.longitudeDelta=myMap.region.span.longitudeDelta /20000.0002;
	region.span=span;
	[myMap setRegion:region animated:TRUE];	
    [myMap setCenterCoordinate:location];
 
    [self setPin];
    
    return 0;
}

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)showInfo:(id)sender
{   
    NSLog(@"ShowInfo Click 1");
    FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
        NSLog(@"ShowInfo Click 2");
    controller.delegate = self;
        NSLog(@"ShowInfo Click 3");
    [controller setOwner:owner];
        NSLog(@"ShowInfo Click 4");
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        NSLog(@"ShowInfo Click 5");
    [self presentModalViewController:controller animated:YES];
        NSLog(@"ShowInfo Click 6");
    
    [controller release];
}

- (IBAction)accept:(id)sender
{
    NSLog(@"Accept clicked");
    if(mode == 1)
        [owner reqPickup];
    if(mode == 2)
        [owner acceptPickupReq];
    
    
        [self returnToStandby];
}
- (IBAction)reject:(id)sender
{
    
    NSLog(@"Reject Clicked");
    
    if(mode == 2)
        [owner rejectPickupReq];
    [self returnToStandby];
}
- (int)returnToStandby
{
    [myTextView setHidden:true];
    [btnAcc setHidden:true];
    [btnCan setHidden:true];
    
    return 0;
}

- (int)recReqPickup:(NSString *) msg
{
    NSLog(@"View recpick");
    mode = 2;
    [myTextView setText:msg];
    [myTextView setHidden:false];
    [btnAcc setHidden:false];
    [btnCan setHidden:false];
    
    return 0;
}

- (IBAction)reqPickup:(id)sender;
{
    NSLog(@"Reqd pickup clicked");
    mode = 1;
    [myTextView setText:@"Are you sure you want to request a Taxi to your current location?"];
    [myTextView setHidden:false];
    [btnAcc setHidden:false];
    [btnCan setHidden:false];
    
    //[owner reqPickup];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc
{
    [_managedObjectContext release];
    [super dealloc];
}

- (int) showMsg:(NSString *)msg
{
    NSLog(@"View recieved message");
    mode = 3;
    
    [myTextView setText:msg];
    [myTextView setHidden:false];
    [btnAcc setHidden:false];
    
    return 0;
    
}
@end











