//
//  UserViewController.h
//  RelationalCD
//
//  Created by Misato Tina Alexandre on 8/5/13.
//  Copyright (c) 2013 Misato Tina Alexandre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface UserViewController : UIViewController <NSFetchedResultsControllerDelegate>
@property (nonatomic, strong) User *theUser;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *businessNameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *password;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;


@end
