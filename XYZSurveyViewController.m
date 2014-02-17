//
//  XYZSurveyViewController.m
//  RestaurantSurvey
//
//  Created by Burke Holland on 2/12/14.
//  Copyright (c) 2014 Burke Holland. All rights reserved.
//

#import "XYZSurveyViewController.h"
#import "XYZSelectLocationViewController.h"
#import <EverliveSDK/EverliveSDK.h>
#import "XYZLocation.h"
#import "Ratings.h"

@interface XYZSurveyViewController ()

@property (weak, nonatomic) IBOutlet UISlider *ratingSlider;
@property (weak, nonatomic) IBOutlet UITableViewCell *locationCell;
@property XYZSelectLocationViewController *selectLocation;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
- (IBAction)submitButtonTouchUpInside:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *appetizerToggle;

@end

@implementation XYZSurveyViewController


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
    
    [Everlive setApplicationKey:@"eVKxNui85A6TopjR"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    
//    // Configure the cell...
//    
//    return cell;
//}

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


#pragma mark - Navigation

//In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    XYZSelectLocationViewController *selectLocationController = [segue destinationViewController];
    selectLocationController.delegate = self;
}

- (void)selectLocationViewController:(XYZSelectLocationViewController *)selectLocationViewController didSelectLocation:(XYZLocation *)location {
    
    self.detailLabel.text = location.title;
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 1) {
        [self performSegueWithIdentifier:@"locationsSegue" sender:indexPath];
    }
}


- (IBAction)submitButtonTouchUpInside:(id)sender {

    Ratings *rating = [[Ratings alloc] init];
    EVDataStore *dataStore = [EVDataStore  sharedInstance];
    
    rating.location = self.detailLabel.text;
    rating.appetizer = [NSString stringWithFormat:@"%d", self.appetizerToggle.isOn];
    rating.rating = [NSNumber numberWithFloat:self.ratingSlider.value];
    
    [dataStore create:rating block:^(BOOL success, NSError *error) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Survey Complete!"
                                                        message:@"Thank you.  Your feedback has been recorded."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }];
}



@end

