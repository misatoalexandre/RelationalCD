//
//  ServiceDetailViewController.h
//  RelationalCD
//
//  Created by Misato Tina Alexandre on 7/28/13.
//  Copyright (c) 2013 Misato Tina Alexandre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Service.h"
@interface ServiceDetailViewController : UIViewController
@property (nonatomic, strong) Service *currentService;
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionField;
@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
- (IBAction)edit:(id)sender;
- (IBAction)done:(id)sender;

@end
