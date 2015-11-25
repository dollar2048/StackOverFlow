//
//  QuestionItem.m
//  StackOverFlow
//
//  Created by Sergei Prikhodko on 25.11.15.
//  Copyright © 2015 Sergei Prikhodko. All rights reserved.
//

#import "QuestionItem.h"

@interface QuestionItem ()
@property (nonatomic, strong) OwnerItem *owner;
@property (nonatomic, copy) NSString *creation_date;
@property (nonatomic, copy) NSString *title;
@end

static NSString *const kOwner = @"owner";
static NSString *const kCreation_date = @"creation_date";
static NSString *const kTitle = @"title";

@implementation QuestionItem

+ (instancetype)questionItemWithJSONDict:(NSDictionary *)JSONDict
{
    QuestionItem *question = [QuestionItem new];
    question.owner = [OwnerItem ownerItemWithJSONDict:JSONDict[kOwner]];
    question.creation_date = JSONDict[kCreation_date];
    question.title = JSONDict[kTitle];

    return question;
}

@end
