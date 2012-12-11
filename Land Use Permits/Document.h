//
//  Document.h
//  Land Use Permits
//
//  Created by Craig Beck on 11/21/12.
//  Copyright (c) 2012 Craig Beck. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <MapKit/MapKit.h>
#import "Applicant.h"
#import "Application.h"
#import "Property.h"

#define METERS_PER_MILE 1609.344

@interface Document : NSPersistentDocument <MKMapViewDelegate, MKGeocoderDelegate, NSURLConnectionDataDelegate>

@property (assign) IBOutlet NSTextField *addressField;
@property (assign) IBOutlet MKMapView *mapView;
@property (assign) IBOutlet NSArrayController *applications;
@property (assign) IBOutlet NSArrayController *applicants;
@property (assign) IBOutlet MKMapView *applicantPropertyMapView;
@property (assign) IBOutlet MKMapView *applicationPropertyMapView;
@property (assign) IBOutlet MKMapView *propertyMapView;
@property (assign) IBOutlet NSArrayController *applicationArrayController;
@property (assign) IBOutlet NSButton *removeButton;
@property (assign) IBOutlet NSButton *fetchDataButton;
@property (assign) IBOutlet NSTextField *propertyField;

- (IBAction)applicantsTableClicked:(NSTableView *)sender;
- (IBAction)seedData:(id)sender;
- (IBAction)addNewRecord:(id)sender;
- (IBAction)removeSelectedRecord:(id)sender;
- (IBAction)fetchData:(id)sender;


+ (Applicant *)findOrCreateApplicantWithName:(NSString *)searchName context:(NSManagedObjectContext *)moc;
+ (NSArray *)applicantsWithName:(NSString *)searchName context:(NSManagedObjectContext *)moc;

+ (Property *)findOrCreatePropertyWithAddress:(NSString *)searchName context:(NSManagedObjectContext *)moc;
+ (NSArray *)propertiesWithAddress:(NSString *)searchName context:(NSManagedObjectContext *)moc;


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;
- (void)connectionDidFinishLoading:(NSURLConnection *)connection;

@end
