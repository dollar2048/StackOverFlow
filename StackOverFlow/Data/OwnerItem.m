//
//  OwnerItem.m
//  StackOverFlow
//
//  Created by Sergei Prikhodko on 25.11.15.
//  Copyright © 2015 Sergei Prikhodko. All rights reserved.
//

#import "OwnerItem.h"

@interface OwnerItem ()
@property (nonatomic, assign) NSInteger reputation;
@property (nonatomic, strong) NSURL *profile_image;
@property (nonatomic, copy) NSString *display_name;
@end

@implementation OwnerItem

+ (instancetype)ownerItemWithJSONDict:(NSDictionary *)JSONDict
{
    NSError *err = nil;
    OwnerItem *owner = [[OwnerItem alloc] initWithDictionary:JSONDict error:&err];
    return owner;
}

@end
