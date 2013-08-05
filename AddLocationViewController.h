//
//  AddLocationViewController.h
//  RelationalCD
//
//  Created by Misato Tina Alexandre on 8/2/13.
//  Copyright (c) 2013 Misato Tina Alexandre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"

@protocol AddLocationViewControllerDelegate; 

@interface AddLocationViewController : UIViewController

@property (nonatomic, strong) Location *currentLocation;
@property (nonatomic, weak) id <AddLocationViewControllerDelegate> delegate;

//TextFields 
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *streetAddressField;
@property (weak, nonatomic) IBOutlet UITextField *unitAddressField;
@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (weak, nonatomic) IBOutlet UITextField *stateField;
@property (weak, nonatomic) IBOutlet UITextField *zipField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionField;

//Buttons
- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end

@protocol AddLocationViewControllerDelegate
-(void)addLocationViewControllerDidSave;
-(void)addLocationViewControllerDidCancel:(Location*)locaitonToDelete;
@end