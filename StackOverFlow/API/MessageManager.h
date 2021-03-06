//
//  MessageManager.h
//  StackOverFlow
//
//  Created by Sergei Prikhodko on 25.11.15.
//  Copyright © 2015 Sergei Prikhodko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageManager : NSObject

+ (void)getQuestionsForKeyWord:(NSString *)keyWord successBlock:(void (^)(NSArray *questions))successBlock failBlock:(void (^)(NSError *error))failBlock;

+ (void)getAnswersForQuestionID:(NSInteger)questionID successBlock:(void (^)(NSArray *answers))successBlock failBlock:(void (^)(NSError *error))failBlock;

@end
