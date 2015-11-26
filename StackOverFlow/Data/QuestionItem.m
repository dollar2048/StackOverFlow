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
@property (nonatomic, strong) NSDate *creation_date;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *body_markdown;
@end

static NSString *const kOwner = @"owner";
static NSString *const kCreation_date = @"creation_date";
static NSString *const kTitle = @"title";
static NSString *const kBodyMarkdown = @"body_markdown";

@implementation QuestionItem

+ (instancetype)questionItemWithJSONDict:(NSDictionary *)JSONDict
{
    QuestionItem *question = [QuestionItem new];
    question.owner = [OwnerItem ownerItemWithJSONDict:JSONDict[kOwner]];
    question.body_markdown = JSONDict[kBodyMarkdown];

    id identifier = JSONDict[kCreation_date];
    if ([identifier isKindOfClass:[NSNumber class]])
        question.creation_date = [NSDate dateWithTimeIntervalSince1970:((NSNumber *)identifier).integerValue];

    question.title = JSONDict[kTitle];

    return question;
}

@end
