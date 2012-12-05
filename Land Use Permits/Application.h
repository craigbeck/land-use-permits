//
//  Application.h
//  Land Use Permits
//
//  Created by Craig Beck on 11/28/12.
//  Copyright (c) 2012 Craig Beck. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Applicant;

@interface Application : NSManagedObject

@property (nonatomic, retain) NSNumber * appealed;
@property (nonatomic, retain) NSString * dateDecided;
@property (nonatomic, retain) NSDate * dateIssued;
@property (nonatomic, retain) NSDate * dateSubmitted;
@property (nonatomic, retain) NSString * permitDescription;
@property (nonatomic, retain) NSString * permitNumber;
@property (nonatomic, retain) NSString * permitType;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) Applicant *applicant;
@property (nonatomic, retain) NSManagedObject *property;

//+ (Applicant *)findOrCreateApplicantWithName:(NSString *)name;

@end
