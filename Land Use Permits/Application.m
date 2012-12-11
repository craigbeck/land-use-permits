//
//  Application.m
//  Land Use Permits
//
//  Created by Craig Beck on 11/28/12.
//  Copyright (c) 2012 Craig Beck. All rights reserved.
//

#import "Application.h"
#import "Applicant.h"
#import "Property.h"


@implementation Application

@dynamic appealed;
@dynamic dateDecided;
@dynamic dateIssued;
@dynamic dateSubmitted;
@dynamic permitDescription;
@dynamic permitNumber;
@dynamic permitType;
@dynamic status;
@dynamic url;
@dynamic applicant;
@dynamic property;


- (void)awakeFromInsert
{
    [super awakeFromInsert];
    int permitNumber = arc4random() % 99999;
    [self setPermitNumber:[[[NSString alloc] initWithFormat:@"n%5.d", permitNumber] autorelease]];
    [self setDateSubmitted:[NSDate date]];
    
    Property *property = [NSEntityDescription insertNewObjectForEntityForName:@"Property" inManagedObjectContext:[self managedObjectContext]];
    [self setProperty:property];
    
    Applicant *applicant = [NSEntityDescription insertNewObjectForEntityForName:@"Applicant" inManagedObjectContext:[self managedObjectContext]];
    [self setApplicant:applicant];
}

+ (Application *)findOrCreateApplicationWithPermitNumber:(NSString *)searchName context:(NSManagedObjectContext *)moc
{
    NSManagedObjectModel *model = [NSManagedObjectModel mergedModelFromBundles:nil];
    NSFetchRequest *request = [model fetchRequestFromTemplateWithName:@"applicationByPermitNumber" substitutionVariables:@{ @"value":searchName }];
    NSError *error = [NSError alloc];
    NSArray *results = [moc executeFetchRequest:request error:&error];
    
    Application *application;
    if (results == nil)
    {
        application = [NSEntityDescription insertNewObjectForEntityForName:@"Application" inManagedObjectContext:moc];
        [application setPermitNumber:searchName];
    }
    else
    {
        application = [results objectAtIndex:0];
    }
    return application;
}

+ (NSArray *)applicationsWithPermitNumber:(NSString *)searchName context:(NSManagedObjectContext *)moc
{
    return @[];
}

@end
