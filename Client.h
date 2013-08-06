//
//  Client.h
//  RelationalCD
//
//  Created by Misato Tina Alexandre on 8/6/13.
//  Copyright (c) 2013 Misato Tina Alexandre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

@interface Client : NSManagedObject

@property (nonatomic, retain) NSString * clientEmail;
@property (nonatomic, retain) NSString * clientFirstName;
@property (nonatomic, retain) NSString * clientLastName;
@property (nonatomic, retain) NSString * clientPhone;
@property (nonatomic, retain) NSSet *packages;
@property (nonatomic, retain) User *serviceProvicer;
@end

@interface Client (CoreDataGeneratedAccessors)

- (void)addPackagesObject:(NSManagedObject *)value;
- (void)removePackagesObject:(NSManagedObject *)value;
- (void)addPackages:(NSSet *)values;
- (void)removePackages:(NSSet *)values;

@end
