//
//  FlipsideViewController.m
//  TaxaApp
//
//  Created by keith.loughnane on 21/07/2011.
//  Copyright 2011 none. All rights reserved.
//

#import "FlipsideViewController.h"


@implementation FlipsideViewController
//@synthesize owner;
@synthesize delegate=_delegate;
@synthesize latTextView;
@synthesize longTextView;
@synthesize btnGPS;

//@synthesize mySettingsHandler;
-(int)initWithOwner : (id) iowner
{
    NSLog(@"Initing Flipside");
	owner  = iowner;
	return 0;
}
-(int)setOwner: (id) iowner
{
    NSLog(@"setting owner in flip");
    owner  = iowner;
    return 0;
}

- (IBAction)textFieldReturn:(id)sender
{
    //NSLog(@"textFieldReturn,%f",[[APRField text] floatValue]);
    
   // [self setValues];
    
    
    [sender resignFirstResponder];
}

- (IBAction)GPSSet:(id)sender
{
    
    NSLog(@"SETTING GPS %f %f",[longTextView.text doubleValue] ,[latTextView.text doubleValue]);
    //[owner getsLoc :  52.300626: -9.669943 :0.0:0.0:0.0];
    [owner getsLocLat : [longTextView.text doubleValue] LLong:[latTextView.text doubleValue] Alt:0.0 LocHacc:0.0 LocVacc:0.0];
    
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}
-(IBAction)segChange:(id)sender
{
    NSLog(@"MySegBTn = %d",[mySegBtn selectedSegmentIndex]);
    [owner setMode:[mySegBtn selectedSegmentIndex]];
        [owner activate];
    
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];  
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end
