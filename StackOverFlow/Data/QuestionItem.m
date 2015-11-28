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
@property (nonatomic) BOOL is_answered;
@property (nonatomic) NSInteger question_id;
@end

@implementation QuestionItem

+ (instancetype)questionItemWithJSONDict:(NSDictionary *)JSONDict
{
    NSError *err = nil;
    QuestionItem *question = [[QuestionItem alloc] initWithDictionary:JSONDict error:&err];
    return question;
}

@end
