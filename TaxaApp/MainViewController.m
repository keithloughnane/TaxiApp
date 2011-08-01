//
//  MainViewController.m
//  TaxaApp
//
//  Created by keith.loughnane on 21/07/2011.
//  Copyright 2011 none. All rights reserved.
//

#import "MainViewController.h"


@implementation MainViewController;
//@synthesize owner;
@synthesize managedObjectContext=_managedObjectContext;
@synthesize myMap;
@synthesize myMain;
@synthesize myTextView;

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
    
    [myMain recNetMsg:@"jiminy"];
    
   //[myMain MainControl];
    location.latitude = 0.000;
	location.longitude = 0.000;	
	[myMap setCenterCoordinate:location];
	MKCoordinateRegion region;
    MKCoordinateSpan span;
    region.center=myMap.region.center;
	
	span.latitudeDelta=myMap.region.span.latitudeDelta /20000.0002;
	span.longitudeDelta=myMap.region.span.longitudeDelta /20000.0002;
	region.span=span;
	[myMap setRegion:region animated:TRUE];	
    [myMap setCenterCoordinate:location];
    
    
    
    [super viewDidLoad];
}
-(int)getsLoc : (double) locLat: (double) locLong : (double) locAlt: (double) LocHAccuracy :  (double) LocVAccuracy
{
        NSLog(@"Current Loc->Long:%f  Lat:%f  Alt:%f  HAccuracy:%f   VAccuracy:%f",locLong,locLat,locAlt,LocHAccuracy,LocVAccuracy);
	NSLog(@"GETS LOC METHOD CALLED %f, %f",locLat,locLong);
    
    
    
    
	//NSLog(@"Undating lable");
	//NSString statusTemp =  @"LOC %f %f",locLat,locLong;
	//statusText.text = statusTemp;
	//NSLog(@"Undating save");
	
	//-(int)saveDataPoint: (NSString *) datetime : (NSString *) datatype : (double) floatData: (NSString *) stringData : (double) errorMargin;
	
	//int time = [self getTime];
	//[myDBControler saveDataPoint:[self getTime]:@"LOCLAT":locLat:@"0":LocHAccuracy];
	//int time = [self getTime];
	//[myDBControler saveDataPoint:[self getTime]:@"LOCLONG":locLong:@"0":LocHAccuracy];
	//int time = [self getTime];
	//[myDBControler saveDataPoint:[self getTime]:@"LOCALT":locAlt:@"0":LocVAccuracy];
	//NSLog(@"Done");
	//location 
	//locStatus =[NSString stringWithFormat:@"Location:\n\tlong:%f\n\tlat:%f",locLong,locLat];
	//statusText.text = [NSString stringWithFormat:@"%f %@ %@",[self getTime],locStatus,accStatus];
	return 0;
}

- (int) upDateLocLong:(double) locLong Lat:(double)locLat Verr:(double)LocVAccuracy
{
    location.latitude = locLong;
	location.longitude = locLat;	
	[myMap setCenterCoordinate:location];
	MKCoordinateRegion region;
    MKCoordinateSpan span;
    region.center=myMap.region.center;
	
	span.latitudeDelta=myMap.region.span.latitudeDelta /20000.0002;
	span.longitudeDelta=myMap.region.span.longitudeDelta /20000.0002;
	region.span=span;
	[myMap setRegion:region animated:TRUE];	
    [myMap setCenterCoordinate:location];

}

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)showInfo:(id)sender
{    
    FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
    controller.delegate = self;
    
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
    
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
    
    [self returnToStandby];
}
- (int)returnToStandby
{
    [myTextView setHidden:true];
    [btnAcc setHidden:true];
    [btnCan setHidden:true];
}

- (int)recReqPickup:(NSString *) msg
{
    NSLog(@"View recpick");
    mode = 2;
    [myTextView setText:msg];
    [myTextView setHidden:false];
    [btnAcc setHidden:false];
    [btnCan setHidden:false];
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

@end
