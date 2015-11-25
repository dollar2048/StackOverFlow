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

static NSString *const kReputation = @"reputation";
static NSString *const kPprofile_image = @"profile_image";
static NSString *const kDisplay_name = @"display_name";

@implementation OwnerItem

+ (instancetype)ownerItemWithJSONDict:(NSDictionary *)JSONDict
{
    OwnerItem *owner = [OwnerItem new];
    owner.reputation = [JSONDict[kReputation] integerValue];
    owner.profile_image = [NSURL URLWithString:JSONDict[kPprofile_image]];
    owner.display_name = JSONDict[kDisplay_name];

    return owner;
}

@end
