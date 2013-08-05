//
//  LocationTableViewController.m
//  RelationalCD
//
//  Created by Misato Tina Alexandre on 8/2/13.
//  Copyright (c) 2013 Misato Tina Alexandre. All rights reserved.
//

#import "LocationTableViewController.h"
#import "Location.h"
#import "DisplayLocationViewController.h"
@interface LocationTableViewController ()

@end

@implementation LocationTableViewController
@synthesize fetchedResultsController=_fetchedResultsController;

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
    
    //perform fetch
    NSError *error =nil;
    if (![[self fetchedResultsController]performFetch:&error]) {
        NSLog(@"Error ! %@", error);
        abort() ;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-displayLocationViewControllerDelegate Method
-(void)displayLocaitonViewControllerDidSave:(DisplayLocationViewController *)controller
{
    [controller.navigationController popViewControllerAnimated:YES];
}
#pragma mark-addLocationViewControllerDelegate Methods
-(void)addLocationViewControllerDidSave{
    NSError *error =nil;
    NSManagedObjectContext *context=self.managedObjectContext;
    if (![context save:&error]) {
        NSLog(@"Error ! %@", error);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)addLocationViewControllerDidCancel:(Location *)locaitonToDelete
{
    NSManagedObjectContext *context =self.managedObjectContext;
    [context deleteObject:locaitonToDelete];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark-prepare for segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier]isEqualToString:@"NewLocation"]) {
        AddLocationViewController *alvc=(AddLocationViewController *)[segue destinationViewController];
        alvc.delegate=self;
        
        Location  *newLocation=(Location *)[NSEntityDescription insertNewObjectForEntityForName:@"Location" inManagedObjectContext:self.managedObjectContext];
        alvc.currentLocation=newLocation;
    }
    if ([[segue identifier]isEqualToString:@"DisplayLocation"]) {
        DisplayLocationViewController *dlvc=(DisplayLocationViewController *)[segue destinationViewController];
        NSIndexPath *indexPath=[self.tableView indexPathForSelectedRow];
        Location *selectedLocation=(Location *)[self.fetchedResultsController objectAtIndexPath:indexPath];
        dlvc.currentLocation=selectedLocation;
        dlvc.delegate=self;
        
      
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [[self.fetchedResultsController sections]count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    id<NSFetchedResultsSectionInfo>secInfo=[[self.fetchedResultsController sections]objectAtIndex:section];
    return [secInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Location *location =[self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text=location.locationTitle;
    
    
    return cell;
}
-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [[[self.fetchedResultsController sections]objectAtIndex:section]name];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        NSManagedObjectContext *context=self.managedObjectContext;
        Location *location=[self.fetchedResultsController objectAtIndexPath:indexPath];
        [context deleteObject:location];
        
        NSError *error=nil;
        if (![context save:&error]) {
            NSLog(@"Error! %@", error);
        }
        
        // [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
   }


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
#pragma mark-Fetched Results Controller Section
-(NSFetchedResultsController *)fetchedResultsController{
    //Lazy instantiation
    if (_fetchedResultsController !=nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Location"
                                              inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"locationName"
                                                                   ascending:YES];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    _fetchedResultsController=[[NSFetchedResultsController alloc]initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:@"city" cacheName:nil];
    
    _fetchedResultsController.delegate=self;
    return _fetchedResultsController;
}
-(void)controllerDidChangeContent:(NSFetchedResultsController *)controller{
    [self.tableView endUpdates];
}
-(void)controllerWillChangeContent:(NSFetchedResultsController *)controller{
    [self.tableView beginUpdates];
}
-(void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableview=self.tableView;
    
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [tableview insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeDelete:
            [tableview deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        case NSFetchedResultsChangeUpdate:{
            Location *changedLocation =[self.fetchedResultsController objectAtIndexPath:indexPath];
            UITableViewCell *cell=[tableview cellForRowAtIndexPath:indexPath];
            cell.textLabel.text=changedLocation.locationTitle;
        }
        case NSFetchedResultsChangeMove:
            [tableview deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableview insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}
-(void)controller:(NSFetchedResultsController *)controller didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type{
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


@end
