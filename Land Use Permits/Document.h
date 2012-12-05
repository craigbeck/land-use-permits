//
//  Document.h
//  Land Use Permits
//
//  Created by Craig Beck on 11/21/12.
//  Copyright (c) 2012 Craig Beck. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <MapKit/MapKit.h>

#define METERS_PER_MILE 1609.344

@interface Document : NSPersistentDocument <MKMapViewDelegate, MKGeocoderDelegate>
@property (assign) IBOutlet NSTextField *addressField;
@property (assign) IBOutlet MKMapView *mapView;
@property (assign) IBOutlet NSArrayController *applications;
@property (assign) IBOutlet NSArrayController *applicants;
@property (assign) IBOutlet MKMapView *applicantPropertyMapView;
@property (assign) IBOutlet MKMapView *applicationPropertyMapView;
@property (assign) IBOutlet MKMapView *propertyMapView;
@property (assign) IBOutlet NSArrayController *applicationArrayController;
- (IBAction)applicantsTableClicked:(NSTableView *)sender;

- (IBAction)seedData:(id)sender;

@end
