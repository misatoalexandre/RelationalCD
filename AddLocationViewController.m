//
//  AddLocationViewController.m
//  RelationalCD
//
//  Created by Misato Tina Alexandre on 8/2/13.
//  Copyright (c) 2013 Misato Tina Alexandre. All rights reserved.
//

#import "AddLocationViewController.h"

@interface AddLocationViewController ()

@end

@implementation AddLocationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.titleField.text=[self.currentLocation locationTitle];
    self.descriptionField.text=[self.currentLocation locationName];
    self.streetAddressField.text=[self.currentLocation streetAddress];
    self.unitAddressField.text=[self.currentLocation unitAddress];
    self.cityField.text=[self.currentLocation city];
    self.stateField.text=[self.currentLocation state];
    self.zipField.text=[self.currentLocation zip];
    self.phoneField.text=[self.currentLocation locationPhone];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    //dismiss and save the context
    [self.currentLocation setLocationTitle:self.titleField.text];
    [self.currentLocation setLocationName:self.descriptionField.text];
    [self.currentLocation setStreetAddress:self.streetAddressField.text];
    [self.currentLocation setUnitAddress:self.unitAddressField.text];
    [self.currentLocation setCity:self.cityField.text];
    [self.currentLocation setState:self.stateField.text];
    [self.currentLocation setZip:self.zipField.text];
    [self.currentLocation setLocationPhone:self.phoneField.text];
    [self.delegate addLocationViewControllerDidSave];
}

- (IBAction)cancel:(id)sender {
    //dismiss and remove the object
    [self.delegate addLocationViewControllerDidCancel:self.currentLocation];
}
@end
