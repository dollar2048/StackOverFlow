//
//  QuestionItem.h
//  StackOverFlow
//
//  Created by Sergei Prikhodko on 25.11.15.
//  Copyright © 2015 Sergei Prikhodko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OwnerItem.h"

@interface QuestionItem : JSONModel

@property (nonatomic, readonly, strong) OwnerItem *owner;
@property (nonatomic, readonly, strong) NSDate *creation_date;
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *body_markdown;

+ (instancetype)questionItemWithJSONDict:(NSDictionary *)JSONDict;

@end
