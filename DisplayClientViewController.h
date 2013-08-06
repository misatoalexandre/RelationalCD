//
//  DisplayClientViewController.h
//  RelationalCD
//
//  Created by Misato Tina Alexandre on 8/6/13.
//  Copyright (c) 2013 Misato Tina Alexandre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Client.h"

@protocol displayClientViewControllerDelegate;

@interface DisplayClientViewController : UIViewController
@property (nonatomic, strong)Client *currentClient;
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;

@property (weak, nonatomic) id<displayClientViewControllerDelegate> delegate;

- (IBAction)save:(id)sender;


@end

@protocol displayClientViewControllerDelegate
-(void)displayClientViewControllerDidSave:(DisplayClientViewController *)controller;
@end
