//
//  ContactListTableViewController.m
//  RelationalCD
//
//  Created by Misato Tina Alexandre on 8/6/13.
//  Copyright (c) 2013 Misato Tina Alexandre. All rights reserved.
//

#import "ContactListTableViewController.h"
#import "Client.h"
@interface ContactListTableViewController ()

@end

@implementation ContactListTableViewController

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
    
    NSError *error =nil;
    if (![[self fetchedResultsController]performFetch:&error]) {
        NSLog(@"Error! %@", error);
        abort() ;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-addClientViewControllerDelegate Methods
-(void)addClientViewControllerDidCancel:(Client *)clientToDelete
{
    NSManagedObjectContext *context=self.managedObjectContext;
    [context deleteObject:clientToDelete];
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)addClientViewControllerDidSave
{
    NSManagedObjectContext *context=self.managedObjectContext;
    NSError *error=nil;
    if (![context save:&error]) {
        NSLog(@"Error! %@", error);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma marl-DisplayViewControllerDelegate Method;
-(void) displayClientViewControllerDidSave:(DisplayClientViewController *)controller{
    [controller
     .navigationController popViewControllerAnimated:YES];
}
#pragma mark-Prepare for segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier]isEqualToString:@"NewClient"]) {
        AddClientViewController *acvc=(AddClientViewController *)[segue destinationViewController];
        acvc.delegate=self;
        
        Client *newClient=(Client *)[NSEntityDescription insertNewObjectForEntityForName:@"Client" inManagedObjectContext:self.managedObjectContext];
        acvc.currentClient=newClient;
    }
    if  ([[segue identifier]isEqualToString:@"DisplayClient"])
    {
        DisplayClientViewController *dcvc=(DisplayClientViewController *)[segue destinationViewController];
        NSIndexPath *indexPath=[self.tableView indexPathForSelectedRow];
        Client *selectedClient=(Client *)[self.fetchedResultsController objectAtIndexPath:indexPath];
        dcvc.currentClient=selectedClient;
        dcvc.delegate=self;
        
    
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
    Client *client=[self.fetchedResultsController objectAtIndexPath:indexPath];
    NSString *fullname = [NSString stringWithFormat:@"%@ %@", client.clientFirstName, client.clientLastName];
    cell.textLabel.text = fullname;
    cell.detailTextLabel.text=client.clientEmail;
    
    
    
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


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSManagedObjectContext *context=self.managedObjectContext;
        Client *client=[self.fetchedResultsController objectAtIndexPath:indexPath];
        [context deleteObject:client];
        
        NSError *error=nil;
        if (![context save:&error]) {
            NSLog(@"Error! %@", error);
        }}
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
#pragma mark
#pragma mark-NSFetchedResultsController Section
-(NSFetchedResultsController *)fetchedResultsController{
    if (_fetchedResultsController !=nil) {
        return _fetchedResultsController;
    }
    
    //create one if it does not exist
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Client"
                                              inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]
                                        initWithKey:@"clientFirstName"
                                        ascending:YES];
    
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    _fetchedResultsController=[[NSFetchedResultsController alloc]initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil]; //add attribute name for section if sections are needed.
    
    _fetchedResultsController.delegate=self;
    return _fetchedResultsController;
    
}
//FetchedResultsControllerDelegate Methods-enable immediate updates in the tableview display.
-(void)controllerWillChangeContent:(NSFetchedResultsController *)controller{
    [self.tableView beginUpdates];
}
-(void)controllerDidChangeContent:(NSFetchedResultsController *)controller{
    [self.tableView endUpdates];
}
-(void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView=self.tableView;
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeUpdate:{
            //1.get the service at the particular cell from fetchedResultsController
            Client *updatedClient = [self.fetchedResultsController objectAtIndexPath:indexPath];
            
            //2.grab the current location of it.
            UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
            //3. change Client Name.
            
            cell.textLabel.text=updatedClient.clientFirstName;
        }
            break;
    }
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     initWith *detailViewController = [[; alloc] initWithNibName:@" con" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}


@end
