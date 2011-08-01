//
//  MainViewController.h
//  TaxaApp
//
//  Created by keith.loughnane on 21/07/2011.
//  Copyright 2011 none. All rights reserved.
//

#import "FlipsideViewController.h"
#import "MainControl.h"
#import <MapKit/MapKit.h>
#import <CoreData/CoreData.h>



@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
	//IBOutlet MKMapView *myMap;
    CLLocationCoordinate2D location;
    MainControl *myMain;
    
    id owner;
        int mode; // 0 = standby, 1 = requesting pickup; 2 = pickupreqested by someone; 3 = no response message
    
    	IBOutlet MKMapView *myMap;
    IBOutlet UITextView *myTextView;
    
    IBOutlet UIButton *btnAcc, *btnCan;
    
}

-(int)initWithOwner : (id) owner;
- (IBAction)showInfo:(id)sender;
- (IBAction)accept:(id)sender;
- (IBAction)reject:(id)sender;
- (IBAction)reqPickup:(id)sender;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic,retain) UIButton *btnCan;
@property (nonatomic,retain) UIButton *btnAcc;
@property (retain, nonatomic) MKMapView *myMap;
@property (retain, nonatomic) MainControl *myMain;
@property (retain, nonatomic) UITextView *myTextView;
//@property (retain, nonatomic) MKMapView *myMap;

- (void)updateMap;
@end


