//
//  Document.m
//  Land Use Permits
//
//  Created by Craig Beck on 11/21/12.
//  Copyright (c) 2012 Craig Beck. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "Document.h"
#import "PermitAnnotation.h"
#import "Applicant.h"
#import "Application.h"
#import "Property.h"

@implementation Document

- (id)init
{
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
    }
    return self;
}

- (NSString *)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"Document";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

- (void)goToStart:(id)obj
{
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = 47.622890;
    coordinate.longitude = -122.335317;
    [obj setCenterCoordinate:coordinate zoomLevel:12 animated:NO];
}

+ (BOOL)autosavesInPlace
{
    return YES;
}

- (IBAction)goToAddress:(id)sender
{
    MKGeocoder *geocoder = [[MKGeocoder alloc] initWithAddress:[[self addressField] stringValue]];
    geocoder.delegate = self;
    [geocoder start];
}

#pragma mark - MKGeocoder protocol
- (void)geocoder:(MKGeocoder *)geocoder didFindCoordinate:(CLLocationCoordinate2D)coordinate
{
    for (id annotation in [[self mapView] annotations])
    {
        [[self mapView] removeAnnotation:annotation];
    }
    [[self mapView] setCenterCoordinate:coordinate zoomLevel:16 animated:NO];
    PermitAnnotation *annotation = [[PermitAnnotation alloc] initWithCoordinate:coordinate];
    [[self mapView] addAnnotation:[annotation autorelease]];
}

- (void)geocoder:(MKGeocoder *)geocoder didFailWithError:(NSError *)error
{
    NSLog(@"goecoder lookup failed: %@", error);
}

- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated
{
//    MKCoordinateRegion viewRegion = [mapView region];
//    NSLog(@"regionWillChange center: %f,%f span: %f,%f animated: %d", viewRegion.center.latitude, viewRegion.center.longitude, viewRegion.span.latitudeDelta, viewRegion.span.longitudeDelta, animated);
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
//    MKCoordinateRegion viewRegion = [mapView region];
//    NSLog(@"regionDidChange center: %f,%f span: %f,%f animated: %d", viewRegion.center.latitude, viewRegion.center.longitude, viewRegion.span.latitudeDelta, viewRegion.span.longitudeDelta, animated);
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKPinAnnotationView *pin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pin"];
    pin.animatesDrop = YES;
    pin.pinColor = MKPinAnnotationColorGreen;
    return [pin autorelease];
}

- (IBAction)applicantsTableClicked:(NSTableView *)sender {
    NSArray *selected = [self.applicationArrayController selectedObjects];
    Application *application = [selected objectAtIndex:0];
    Property *property = (Property *)application.property;
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = [property.latitude doubleValue];
    coordinate.longitude = [property.longitude doubleValue];
    [self.applicationPropertyMapView setCenterCoordinate:coordinate zoomLevel:16 animated:NO];
}

- (IBAction)seedData:(id)sender
{
    Applicant *applicant = [NSEntityDescription insertNewObjectForEntityForName:@"Applicant" inManagedObjectContext:self.managedObjectContext];
    [applicant setName:@"John Doe"];
    
    Application *application = [NSEntityDescription insertNewObjectForEntityForName:@"Application"
                                                              inManagedObjectContext:self.managedObjectContext];
    Property *property = [NSEntityDescription insertNewObjectForEntityForName:@"Property"
                                                       inManagedObjectContext:self.managedObjectContext];
    [property setAddress:@"211 John St"];
    [property setLatitude:@(47.70234824)]; // "47.70234824", "-122.31346387"
    [property setLongitude:@(-122.31346387)];
    
    application.permitNumber = @"pmt456";
    [application setPermitDescription:@"Subdivide Plat for Condo/Multi-Tenant use"];
    [application setProperty:property];
    [application setApplicant:applicant];
}

#pragma mark - Find or Create Entity Methods




- (IBAction)addNewRecord:(id)sender
{
    
}

- (IBAction)removeSelectedRecord:(id)sender
{
}

- (IBAction)fetchData:(id)sender
{
}
@end
