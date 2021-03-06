//
//  AddClientViewController.h
//  RelationalCD
//
//  Created by Misato Tina Alexandre on 8/6/13.
//  Copyright (c) 2013 Misato Tina Alexandre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Client.h"

@protocol addClientViewControllerDelegate;

@interface AddClientViewController : UIViewController

@property (nonatomic, strong) Client *currentClient;
@property (nonatomic, weak) id<addClientViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;



- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end

@protocol addClientViewControllerDelegate
-(void)addClientViewControllerDidSave;
-(void)addClientViewControllerDidCancel:(Client*)clientToDelete;


@end