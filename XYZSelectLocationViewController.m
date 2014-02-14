//
//  XYZSelectLocationViewController.m
//  RestaurantSurvey
//
//  Created by Burke Holland on 2/12/14.
//  Copyright (c) 2014 Burke Holland. All rights reserved.
//

#import "XYZSelectLocationViewController.h"
#import "XYZLocation.h"

@interface XYZSelectLocationViewController ()

- (IBAction)pushToLocations:(UIStoryboardSegue *)segue;
@property NSArray *locations;
@end

@implementation XYZSelectLocationViewController

- (IBAction)pushToLocations:(UIStoryboardSegue *)segue {
    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    XYZLocation *northLocation = [[XYZLocation alloc] init];
    northLocation.title = @"north";
    XYZLocation *southLocation = [[XYZLocation alloc] init];
    southLocation.title = @"south";
    XYZLocation *eastLocation = [[XYZLocation alloc] init];
    eastLocation.title = @"east";
    XYZLocation *westLocation = [[XYZLocation alloc] init];
    westLocation.title = @"west";
    
    
    self.locations = @[northLocation, southLocation, eastLocation, westLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.locations count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    XYZLocation *location = [self.locations objectAtIndex:indexPath.row];
    
    cell.textLabel.text = location.title;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

//#pragma mark - Navigation
//
//- (void)viewDidDisappear:(BOOL)animated {
// 
//    NSLog(@"Location List Segue");
//    
//}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    XYZLocation *selectedLocation = [self.locations objectAtIndex:indexPath.row];
    
    [self.delegate selectLocationViewController:self didSelectLocation:selectedLocation];
}

@end
