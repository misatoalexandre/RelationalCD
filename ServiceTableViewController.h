//
//  ServiceTableViewController.h
//  RelationalCD
//
//  Created by Misato Tina Alexandre on 7/28/13.
//  Copyright (c) 2013 Misato Tina Alexandre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddServiceViewController.h"

@interface ServiceTableViewController : UITableViewController <AddServiceViewControllerDelegate, NSFetchedResultsControllerDelegate> //to enable immediate fetch
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSFetchedResultsController  *fetchedResultsController;

@end
