//
//  Location.h
//  RelationalCD
//
//  Created by Misato Tina Alexandre on 7/31/13.
//  Copyright (c) 2013 Misato Tina Alexandre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Location : NSManagedObject

@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * locationName;
@property (nonatomic, retain) NSString * locationPhone;
@property (nonatomic, retain) NSString * locationTitle;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSString * streetAddress;
@property (nonatomic, retain) NSString * unitAddress;
@property (nonatomic, retain) NSString * zip;
@property (nonatomic, retain) NSSet *sessions;
@end

@interface Location (CoreDataGeneratedAccessors)

- (void)addSessionsObject:(NSManagedObject *)value;
- (void)removeSessionsObject:(NSManagedObject *)value;
- (void)addSessions:(NSSet *)values;
- (void)removeSessions:(NSSet *)values;

@end
