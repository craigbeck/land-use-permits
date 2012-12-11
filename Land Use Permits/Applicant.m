//
//  Applicant.m
//  Land Use Permits
//
//  Created by Craig Beck on 11/28/12.
//  Copyright (c) 2012 Craig Beck. All rights reserved.
//

#import "Applicant.h"


@implementation Applicant

@dynamic name;
@dynamic applications;

//
//+ (Applicant *)findOrCreateApplicantWithName:(NSString *)searchName context:(NSManagedObjectContext *)moc
//{
//    
//    NSError *error = nil;
//    NSArray *fetchedObjects = [moc executeFetchRequest:fetchRequest error:&error];
//    if (fetchedObjects == nil) {
//        NSLog(@"fetch error = %@",error);
//    }
//    NSLog(@"fetchObjects = %@",fetchedObjects);
//}

//+ (NSArray *)applicantsWithName:(NSString *)searchName context:(NSManagedObjectContext *)moc
//{
//    
//}

@end
