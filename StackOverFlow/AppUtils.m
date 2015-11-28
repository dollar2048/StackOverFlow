//
//  AppUtils.m
//  StackOverFlow
//
//  Created by Sergei Prikhodko on 28.11.15.
//  Copyright © 2015 Sergei Prikhodko. All rights reserved.
//

#import "AppUtils.h"

@implementation AppUtils

static NSDateFormatter *dateFormatter = nil;

+ (NSString *)stringFromDate:(NSDate *)date
{
    if (!dateFormatter)
    {
        dateFormatter = [NSDateFormatter new];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    }
    return [dateFormatter stringFromDate:date];
}

@end
