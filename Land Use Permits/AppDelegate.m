//
//  AppDelegate.m
//  Land Use Permits
//
//  Created by Craig Beck on 11/24/12.
//  Copyright (c) 2012 Craig Beck. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate


- (void)fetchData
{
    NSString *address = @"https://data.seattle.gov/api/views/e76w-qndj/rows.json?max_rows=100";
    NSLog(@"fetching data from %@", address);
    
    NSURL *url = [NSURL URLWithString:address];
    NSURLRequest *request = [[[NSURLRequest alloc] initWithURL:url] autorelease];
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    [connection start];
    
}

@end
