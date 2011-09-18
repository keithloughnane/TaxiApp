//
//  FlipsideViewController.h
//  TaxaApp
//
//  Created by keith.loughnane on 21/07/2011.
//  Copyright 2011 none. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "SettingsHandler.h"

@protocol FlipsideViewControllerDelegate;

@interface FlipsideViewController : UIViewController {
	id owner;
    //SettingsHandler *mySettingsHandler;
    IBOutlet UISegmentedControl *mySegBtn;
    
    IBOutlet UITextField *longTextView;
    IBOutlet UITextField *latTextView;
    
    IBOutlet UIButton *btnGPS;
}
@property (nonatomic,retain) UIButton *btnGPS;
//@property (retain, nonatomic) SettingsHandler *mySettingsHandler;

@property (retain, nonatomic) UITextField *longTextView;
@property (retain, nonatomic) UITextField *latTextView;

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;

-(int)initWithOwner : (id) iowner;
-(int)setOwner: (id) iowner;
- (void)dealloc;
- (void)viewDidLoad;
- (void)viewDidUnload;
- (IBAction)done:(id)sender;
-(IBAction)segChange:(id)sender;
-(int)initWithOwner : (id) owner;
- (IBAction)done:(id)sender;
- (void)didReceiveMemoryWarning;
- (IBAction)GPSSet:(id)sender;
- (IBAction)textFieldReturn:(id)sender;

@end

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;

@end
