//
//  AnswerItem.h
//  StackOverFlow
//
//  Created by Sergei Prikhodko on 28.11.15.
//  Copyright © 2015 Sergei Prikhodko. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface AnswerItem : JSONModel

@property (strong, nonatomic) NSDate *creation_date;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *body;
@property (copy, nonatomic) NSString *body_markdown;
@property (strong, nonatomic) NSArray<Optional> *comments;

@end
