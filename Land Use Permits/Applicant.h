//
//  Applicant.h
//  Land Use Permits
//
//  Created by Craig Beck on 11/28/12.
//  Copyright (c) 2012 Craig Beck. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Applicant : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *applications;
@end

@interface Applicant (CoreDataGeneratedAccessors)

- (void)addApplicationsObject:(NSManagedObject *)value;
- (void)removeApplicationsObject:(NSManagedObject *)value;
- (void)addApplications:(NSSet *)values;
- (void)removeApplications:(NSSet *)values;

@end
