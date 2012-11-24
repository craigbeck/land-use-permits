//
//  Document.m
//  Land Use Permits
//
//  Created by Craig Beck on 11/21/12.
//  Copyright (c) 2012 Craig Beck. All rights reserved.
//

#import "Document.h"
#import <MapKit/MapKit.h>

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
    
    [[self mapView] setDelegate: self];

    NSString *address = @"18357 Evanston Ave N, Shoreline WA";
    [[self addressField] setStringValue:address];
//    NSLog(@"address: %@", address);
//    MKGeocoder *geocoderCoord = [[MKGeocoder alloc] initWithAddress:address];
//    geocoderCoord.delegate = self;
//    [geocoderCoord start];
    [self goToAddress:self];
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
    NSLog(@"found lat: %f lon: %f", coordinate.latitude, coordinate.longitude);
    MKCoordinateRegion viewRegion = [[self mapView] region];
    NSLog(@"region span lat: %f lon: %f", viewRegion.span.latitudeDelta, viewRegion.span.longitudeDelta);
    
//    MKCoordinateSpan span = MKCoordinateSpanMake(0.009, 0.02);
//    MKCoordinateRegion region = MKCoordinateRegionMake(coordinate, span);
//    [[self mapView] setRegion:region animated:YES];
    [[self mapView] setCenterCoordinate:coordinate animated:YES];
}

- (void)geocoder:(MKGeocoder *)geocoder didFailWithError:(NSError *)error
{
    NSLog(@"failed: %@", error);
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    MKCoordinateRegion region = [mapView region];
    NSLog(@"center: %f,%f span: %f,%f viewSize: %@", region.center.latitude, region.center.longitude, region.span.latitudeDelta, region.span.longitudeDelta, NSStringFromRect([mapView bounds]));
}

@end
