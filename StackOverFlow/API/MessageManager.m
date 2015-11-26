//
//  MessageManager.m
//  StackOverFlow
//
//  Created by Sergei Prikhodko on 25.11.15.
//  Copyright © 2015 Sergei Prikhodko. All rights reserved.
//

#import "MessageManager.h"
#import <AFNetworking/AFNetworking.h>
#import "QuestionItem.h"

static NSString *const kURLDomen = @"https://api.stackexchange.com/2.2/";

@interface MessageManager ()
@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;
@end

@implementation MessageManager

@end
