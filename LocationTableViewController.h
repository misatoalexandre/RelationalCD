//
//  LocationTableViewController.h
//  RelationalCD
//
//  Created by Misato Tina Alexandre on 8/2/13.
//  Copyright (c) 2013 Misato Tina Alexandre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddLocationViewController.h"

@interface LocationTableViewController : UITableViewController<AddLocationViewControllerDelegate, NSFetchedResultsControllerDelegate>
@property (nonatomic, strong)   NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong)   NSFetchedResultsController *fetchedResultsController;


@end
