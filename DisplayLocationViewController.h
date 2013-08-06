//
//  DisplayLocationViewController.h
//  RelationalCD
//
//  Created by Misato Tina Alexandre on 8/5/13.
//  Copyright (c) 2013 Misato Tina Alexandre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"
@protocol displayLocationViewControllerDelegate;

@interface DisplayLocationViewController : UIViewController

@property(nonatomic, strong) Location *currentLocation;
@property (nonatomic, weak) id<displayLocationViewControllerDelegate>delegate;


@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionField;
@property (weak, nonatomic) IBOutlet UITextField *streetAddressField;
@property (weak, nonatomic) IBOutlet UITextField *unitAddressField;
@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (weak, nonatomic) IBOutlet UITextField *stateField;
@property (weak, nonatomic) IBOutlet UITextField *zipField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;



- (IBAction)save:(id)sender;

@end

@protocol displayLocationViewControllerDelegate
-(void)displayLocaitonViewControllerDidSave:(DisplayLocationViewController *)controller;

@end
