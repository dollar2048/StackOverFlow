//
//  QuestionItem.h
//  StackOverFlow
//
//  Created by Sergei Prikhodko on 25.11.15.
//  Copyright © 2015 Sergei Prikhodko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OwnerItem.h"

@interface QuestionItem : NSObject

@property (nonatomic, readonly, strong) OwnerItem *owner;
@property (nonatomic, readonly, copy) NSString *creation_date;
@property (nonatomic, readonly, copy) NSString *title;

+ (instancetype)questionItemWithJSONDict:(NSDictionary *)JSONDict;

@end
