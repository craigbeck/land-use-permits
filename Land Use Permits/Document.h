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

- (IBAction)goToAddress:(id)sender;

@end
