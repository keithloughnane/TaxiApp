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
}
@property (nonatomic,retain) UIButton *btnCan;
//@property (retain, nonatomic) SettingsHandler *mySettingsHandler;
-(IBAction)segChange:(id)sender;

-(int)initWithOwner : (id) owner;
@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end



@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;


@end
