//
//  Service.h
//  RelationalCD
//
//  Created by Misato Tina Alexandre on 7/28/13.
//  Copyright (c) 2013 Misato Tina Alexandre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Service : NSManagedObject

@property (nonatomic, retain) NSString * serviceTitle;
@property (nonatomic, retain) NSString * serviceDescription;
@property (nonatomic, retain) NSSet *sessions;
@end

@interface Service (CoreDataGeneratedAccessors)

- (void)addSessionsObject:(NSManagedObject *)value;
- (void)removeSessionsObject:(NSManagedObject *)value;
- (void)addSessions:(NSSet *)values;
- (void)removeSessions:(NSSet *)values;

@end
