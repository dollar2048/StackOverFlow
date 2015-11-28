//
//  OwnerItem.h
//  StackOverFlow
//
//  Created by Sergei Prikhodko on 25.11.15.
//  Copyright © 2015 Sergei Prikhodko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface OwnerItem : JSONModel

@property (nonatomic, readonly, assign) NSInteger reputation;
@property (nonatomic, readonly, strong) NSURL *profile_image;
@property (nonatomic, readonly, copy) NSString *display_name;

+ (instancetype)ownerItemWithJSONDict:(NSDictionary *)JSONDict;

@end
