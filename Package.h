//
//  Package.h
//  RelationalCD
//
//  Created by Misato Tina Alexandre on 8/6/13.
//  Copyright (c) 2013 Misato Tina Alexandre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Client;

@interface Package : NSManagedObject

@property (nonatomic, retain) NSDate * dateOfPurchase;
@property (nonatomic, retain) NSString * notes;
@property (nonatomic, retain) NSNumber * numberOfUsedSessions;
@property (nonatomic, retain) NSString * packageID;
@property (nonatomic, retain) NSNumber * packageTotalNumberOfSessions;
@property (nonatomic, retain) Client *client;
@property (nonatomic, retain) NSSet *sessions;
@end

@interface Package (CoreDataGeneratedAccessors)

- (void)addSessionsObject:(NSManagedObject *)value;
- (void)removeSessionsObject:(NSManagedObject *)value;
- (void)addSessions:(NSSet *)values;
- (void)removeSessions:(NSSet *)values;

@end
