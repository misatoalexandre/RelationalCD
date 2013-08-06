//
//  ContactListTableViewController.h
//  RelationalCD
//
//  Created by Misato Tina Alexandre on 8/6/13.
//  Copyright (c) 2013 Misato Tina Alexandre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddClientViewController.h"
#import "DisplayClientViewController.h"

@interface ContactListTableViewController : UITableViewController<NSFetchedResultsControllerDelegate, addClientViewControllerDelegate, displayClientViewControllerDelegate>

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;



@end
