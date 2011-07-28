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
	IBOutlet MKMapView *myMap;
    CLLocationCoordinate2D location;
    MainControl *myMain;
    
    id owner;
    
    
}

-(int)initWithOwner : (id) owner;
- (IBAction)showInfo:(id)sender;

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (retain, nonatomic) MKMapView *myMap;
@property (retain, nonatomic) MainControl *myMain;

- (void)updateMap;
@end


