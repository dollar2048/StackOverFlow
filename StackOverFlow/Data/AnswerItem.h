//
//  AnswerItem.h
//  StackOverFlow
//
//  Created by Sergei Prikhodko on 28.11.15.
//  Copyright © 2015 Sergei Prikhodko. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "CommentItem.h"

@protocol CommentItem
@end

@interface AnswerItem : JSONModel

@property (strong, nonatomic) NSDate *creation_date;
@property (copy, nonatomic) NSString *body;
@property (assign, nonatomic) NSInteger score;
@property (strong, nonatomic) NSArray<CommentItem, Optional> *comments;

@end
