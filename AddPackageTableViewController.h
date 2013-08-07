//
//  AddPackageTableViewController.h
//  RelationalCD
//
//  Created by Misato Tina Alexandre on 8/6/13.
//  Copyright (c) 2013 Misato Tina Alexandre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Package.h"
@protocol addPackageTableViewControllerDelegate;

@interface AddPackageTableViewController : UITableViewController


@property (weak, nonatomic) IBOutlet UITextField *purchasedDateField;
@property (weak, nonatomic) IBOutlet UITextField *notesField;
@property (weak, nonatomic) IBOutlet UITextField *packageIDField;
@property (weak, nonatomic) IBOutlet UITextField *packageSizeField;

@property (strong, nonatomic) Package *currentPackage;
@property (weak, nonatomic) id<addPackageTableViewControllerDelegate>delegate;

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

@end

@protocol addPackageTableViewControllerDelegate
-(void)addPackageTableViewControllerDidSave;
-(void)addPackageTableViewControllerDidCancel:(Package *)packageToDelete;

@end