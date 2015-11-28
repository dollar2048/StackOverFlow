//
//  QuestionItem.m
//  StackOverFlow
//
//  Created by Sergei Prikhodko on 25.11.15.
//  Copyright © 2015 Sergei Prikhodko. All rights reserved.
//

#import "QuestionItem.h"


@implementation QuestionItem

+ (instancetype)questionItemWithJSONDict:(NSDictionary *)JSONDict
{
    NSError *err = nil;
    QuestionItem *question = [[QuestionItem alloc] initWithDictionary:JSONDict error:&err];
    return question;
}

@end
