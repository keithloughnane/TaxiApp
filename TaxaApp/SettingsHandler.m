//
//  SettingsHandler.m
//  TaxaApp
//
//  Created by keith.loughnane on 21/07/2011.
//  Copyright 2011 none. All rights reserved.
//

#import "SettingsHandler.h"
#include <stdlib.h>


@implementation SettingsHandler
//@synthesize owner;
-(int)initWithOwner : (id) iowner
{
        NSLog(@"Initing Settings Handler");
	owner  = iowner;
    
	return 0;
}
/***************************************************************************************************************
 Saving/Loading Stuff
 *************************************************************************************************************/
- (NSString *) optionsFilePath
{	
	
	//Dont using new string add to existing string and send to lable, do not clear.
	//NSString *tempString;	
	/////
	//NSLog(@"options file path");
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	//NSLog(@"2");
	NSString *documentsDirectory = [paths objectAtIndex:0];
	//NSLog(@"3");
	
	//tempString =[[NSString alloc] initWithCString: "\nSetting up path\n"];
	//newString = [newString stringByAppendingString:tempString];	
	
	//tempString =[[NSString alloc] initWithCString: documentsDirectory];
	//newString = [newString stringByAppendingString:documentsDirectory];	
	
	//NSLog(@"4");
	NSString *tempPath = [[NSString alloc] initWithCString: "options.plist"];
	//NSLog(@"5");
	//[paths release];
	return [documentsDirectory stringByAppendingPathComponent:tempPath];	
	
	//return documentsDirectory;
	
}
-(int)LoadOptions
{
	
    NSLog(@"Loading Options:");	
	NSString *path = [self optionsFilePath];
	
	
	//tempString =[[NSString alloc] initWithCString:path];
	//newString = [newString stringByAppendingString:tempString];	
	
	//path = [path stringByAppendingString:kFilename];
	
	
    
	@try
	{
		if([[NSFileManager defaultManager] fileExistsAtPath:path])
		{
			//NSLog(@"File Existing Continueing");
			//tempString =[[NSString alloc] initWithCString: "\nMade it into IF w/path =>"];
			//newString = [newString stringByAppendingString:tempString];
			
			//newString = [newString stringByAppendingString:path];	
			//NSNumber *myNo;
			NSMutableArray *array = [[NSArray alloc] initWithContentsOfFile:path];
			
			
			//tempString = [NSString stringWithFormat:@"%i", [array count]];	
			//newString = [newString stringByAppendingString:tempString];				
			//NSLog(@"count = %i", [array count]);
			
			NSNumber *numx;			
			//LEVEL
			numx = [array objectAtIndex:0];
			//level = [numx intValue];
			//NSLog(@"loaded Level no (%i)",level);
			//TIME
			numx = [array objectAtIndex:1];
			//game_time= [numx doubleValue];
			//NSLog(@"loaded time (%d)",game_time);
			
			//SCORE
			numx = [array objectAtIndex:2];
			//score = [numx intValue];		
			
			//NSLog(@"score (%i)",score);
			//y[i] = (int)[array objectAtIndex:i+bodies];
			
			//tempString =[[NSString alloc] initWithCString: "\nRealeasing"];
			//newString = [newString stringByAppendingString:tempString];
			
			
			
			/*if ([path length]>0)
             {
             [path release];
             }*/
			
			
			
			[array release];
		}
		
		
	}
	@catch (NSException *exception) {
		//NSLog(@"This aint good %@: %@",[exception name],[exception reason]);
		//NSString *tempString =[[NSString alloc] initWithCString: "\nLoad failed"];
		//newString = [newString stringByAppendingString:tempString];	
		
	}
	@finally
	{
	}
    
    return 0;
	
}

-(int)SaveOptions
{
	//NSLog(@"Saving Options:");
	NSString *path = [self optionsFilePath];
    NSString *tmpPath = [path stringByAppendingString:@".tmp"];
	//path = [path stringByAppendingString:kFilename];
	//NSLog(@"decraring number");
	NSNumber *myNo;
	//NSLog(@"declaring array");
	NSMutableArray *array = [[NSMutableArray alloc] init];
	
	
	//NSLog(@"array size:%i",[array count]);	
	
	//LEVEL NUMBER
	//NSLog(@"setting up number");
	//NSLog(@"saving Level no (%i)",level);
	myNo = 0;//[NSNumber numberWithInt:level];
	//tempString = [NSString stringWithFormat:@"%i",x[i]];	
	//newString = [newString stringByAppendingString:tempString];	
	//[array addObject:myNo];
	//NSLog(@"inserting object");
	[array insertObject:myNo atIndex:0];
	
	
	//TIME
	//NSLog(@"setting up number");
	//NSLog(@"saving time (%d)",game_time);
	myNo = 0;//[NSNumber numberWithDouble:game_time];
	//tempString = [NSString stringWithFormat:@"%i",x[i]];	
	//newString = [newString stringByAppendingString:tempString];	
	//[array addObject:myNo];
	//NSLog(@"inserting object");
	[array insertObject:myNo atIndex:1];
	
	
	//Score
	//NSLog(@"setting up number");
	//NSLog(@"score (%i)",score);
	myNo = 0;//[NSNumber numberWithInt:score];
	//tempString = [NSString stringWithFormat:@"%i",x[i]];	
	//newString = [newString stringByAppendingString:tempString];	
	//[array addObject:myNo];
	//NSLog(@"inserting object");
	[array insertObject:myNo atIndex:2];
	
	
	
	
	
	
	
	
	//NSLog(@"bodies:%i",bodies);
	//NSLog(@"array size:%i",[array count]);
	
	//NSString *tempString =[[NSString alloc] initWithCString: "\nSaving State"];
	//newString = [newString stringByAppendingString:tempString];		
	//debugText.text = newString;	
	//NSLog(@"writing...");
	[array writeToFile:tmpPath atomically:YES];
	[array release];
	
    
	//if(level!=0||level!=19)
	{
        [[NSFileManager defaultManager] removeItemAtPath:path  error:nil];
        [[NSFileManager defaultManager] moveItemAtPath:tmpPath toPath:path error:nil];
	}
	[path release];
	return 0;
}






@end
