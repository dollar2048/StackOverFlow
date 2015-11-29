//
//  CommentItem.h
//  StackOverFlow
//
//  Created by Sergei Prikhodko on 29.11.15.
//  Copyright © 2015 Sergei Prikhodko. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface CommentItem : JSONModel
@property (assign, nonatomic) NSInteger comment_id;
@property (assign, nonatomic) NSInteger score;
@property (copy, nonatomic) NSString *body;

@end
