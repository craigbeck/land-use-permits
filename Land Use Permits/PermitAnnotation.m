//
//  PermitAnnotation.m
//  Land Use Permits
//
//  Created by Craig Beck on 11/24/12.
//  Copyright (c) 2012 Craig Beck. All rights reserved.
//

#import "PermitAnnotation.h"

@implementation PermitAnnotation

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate
{
    self = [super init];
    if (self)
    {
        _coordinate = coordinate;
    }
    return self;
}

- (NSString *)title
{
    return [@"#345765" autorelease];
}

- (NSString *)subtitle
{
    return [@"PLAT SHORT" autorelease];
}

@end
