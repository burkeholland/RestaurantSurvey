//
//  XYZSelectLocationViewController.h
//  RestaurantSurvey
//
//  Created by Burke Holland on 2/12/14.
//  Copyright (c) 2014 Burke Holland. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYZLocation.h"

@protocol SelectLocationDelegate;

@interface XYZSelectLocationViewController : UITableViewController

@property XYZLocation *location;
@property(nonatomic, assign) id <SelectLocationDelegate> delegate;

@end

@protocol SelectLocationDelegate <NSObject>
- (void)selectLocationViewController:(XYZSelectLocationViewController *)selectLocationViewController
                   didSelectLocation:(XYZLocation *) location;
@end
