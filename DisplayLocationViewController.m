//
//  DisplayLocationViewController.m
//  RelationalCD
//
//  Created by Misato Tina Alexandre on 8/5/13.
//  Copyright (c) 2013 Misato Tina Alexandre. All rights reserved.
//

#import "DisplayLocationViewController.h"
#import "AppDelegate.h"

@interface DisplayLocationViewController ()

@end

@implementation DisplayLocationViewController

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
    //set the value of fields to that of the selected Row (location)
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
    self.currentLocation.locationTitle=self.titleField.text;
    self.currentLocation.locationName=self.descriptionField.text;
    self.currentLocation.streetAddress=self.streetAddressField.text;
    self.currentLocation.unitAddress=self.unitAddressField.text;
    self.currentLocation.city=self.cityField.text;
    self.currentLocation.state=self.stateField.text;
    self.currentLocation.locationPhone=self.phoneField.text;
    self.currentLocation.zip=self.zipField.text;
    
    AppDelegate *myApp=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    [myApp saveContext];
    
    [self.delegate displayLocaitonViewControllerDidSave:self];
   
    
}
@end
