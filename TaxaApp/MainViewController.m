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

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
-(int)initWithOwner : (id) iowner
{
        NSLog(@"Initing MainView");
	//owner  = iowner;
    
	return 0;
}

- (void)viewDidLoad
{
    
     myMain  = [[MainControl alloc] init];
    
   //[myMain MainControl];
    //location.latitude = [myStatsView getLlat:locIndex ];
	//location.longitude = [myStatsView getLlong:locIndex];	
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
