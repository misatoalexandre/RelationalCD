//
//  AddPackageTableViewController.m
//  RelationalCD
//
//  Created by Misato Tina Alexandre on 8/6/13.
//  Copyright (c) 2013 Misato Tina Alexandre. All rights reserved.
//

#import "AddPackageTableViewController.h"

@interface AddPackageTableViewController ()
-(void) hideDatePicker;
-(void)showDatePicker;
@end

@implementation AddPackageTableViewController

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
    
    self.title=@"Add a Package";
   /*
    //Set up the datePurchasedLabel's interaction to enable display of date picker. 
    self.purchasedDateLabel.userInteractionEnabled=YES;
    UITapGestureRecognizer *dateTapRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showDatePicker)];
    [self.purchasedDateLabel addGestureRecognizer:dateTapRecognizer];
    
    //create a datepicker
    self.datePicker=[[UIDatePicker alloc]initWithFrame:CGRectMake(0, 250, 325, 300)];
    self.datePicker.datePickerMode=UIDatePickerModeDate;
    self.datePicker.hidden=NO;
    self.datePicker.date=[NSDate date];
    
    //Set date picker handler.
    [self.datePicker addTarget:self action:@selector(dateHasChanged) forControlEvents:UIControlEventValueChanged];
   */ 
    //Set values of all fields. 
    self.notesField.text=[self.currentPackage notes];
    self.packageIDField.text=[self.currentPackage packageID];
    
    NSDateFormatter *formatter =[[NSDateFormatter alloc]init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    self.purchasedDateField.text=[formatter stringFromDate:self.currentPackage.dateOfPurchase];
    
}
/*
-(void)dateHasChanged{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    self.purchasedDateLabel.text=[formatter stringFromDate:self.datePicker.date];
    
}
-(void)showDatePicker{
    [self.notesField resignFirstResponder];
    [self.packageIDField resignFirstResponder];
    [self.packageSizeField resignFirstResponder];
    [self.view addSubview:self.datePicker];

    
    /*[UIView beginAnimations:@"SlideInPicker" context:nil];
    [UIView setAnimationDuration:0.5];
    self.datePicker.transform=CGAffineTransformMakeTranslation(0, -216);
    [UIView commitAnimations];
    
}*/


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (IBAction)cancel:(id)sender {
    
}

- (IBAction)save:(id)sender {
    
}
@end
