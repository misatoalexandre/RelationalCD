//
//  User.h
//  RelationalCD
//
//  Created by Misato Tina Alexandre on 8/5/13.
//  Copyright (c) 2013 Misato Tina Alexandre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSString * businessName;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) NSString * userEmail;
@property (nonatomic, retain) NSString * userFirstName;
@property (nonatomic, retain) NSString * userLastName;
@property (nonatomic, retain) NSSet *clients;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addClientsObject:(NSManagedObject *)value;
- (void)removeClientsObject:(NSManagedObject *)value;
- (void)addClients:(NSSet *)values;
- (void)removeClients:(NSSet *)values;

@end
