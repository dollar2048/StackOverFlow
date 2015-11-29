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

@property (nonatomic, assign) NSInteger question_id;
@property (nonatomic, assign) BOOL is_answered;
@property (nonatomic, strong) OwnerItem *owner;
@property (nonatomic, strong) NSDate *creation_date;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString<Optional> *body;
@property (nonatomic, strong) NSArray<Optional> *answers;

@end
