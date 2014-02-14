//
//  XYZRating.m
//  RestaurantSurvey
//
//  Created by Burke Holland on 2/14/14.
//  Copyright (c) 2014 Burke Holland. All rights reserved.
//

#import "Ratings.h"

@implementation Ratings

- (NSDictionary *)getEverlivePropertiesMapping {
    return @{
             @"location" : @"location",
             @"rating" : @"rating",
             @"appetizer" : @"appetizer"
    };
}

@end
