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
#import "AnswerItem.h"

static NSString *const kURLDomen = @"https://api.stackexchange.com/2.2/";

@interface MessageManager ()
@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;
@property (nonatomic, strong) NSError *wrongJSONError;
@end

@implementation MessageManager

+ (instancetype)sharedInstance
{
    static MessageManager *sharedInstance = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      sharedInstance = [[MessageManager alloc] init];
      sharedInstance.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kURLDomen]];
      sharedInstance.sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
      sharedInstance.sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];

    });

    return sharedInstance;
}

- (NSError *)wrongJSONError
{
    if (!_wrongJSONError)
    {
        _wrongJSONError = [NSError errorWithDomain:NSURLErrorDomain
                                              code:1000
                                          userInfo:@{ NSLocalizedDescriptionKey: @"Wrong JSON" }];
    }
    return _wrongJSONError;
}

#pragma mark - Public methods

+ (void)getQuestionsForKeyWord:(NSString *)keyWord successBlock:(void (^)(NSArray *questions))successBlock failBlock:(void (^)(NSError *error))failBlock
{
    NSString *uri = [NSString stringWithFormat:@"search?order=desc&sort=activity&intitle=%@&site=stackoverflow&filter=!.FjtmoGIogKGfL93TUUtkPsr5Tsrp", keyWord];

    AFHTTPSessionManager *sessionManager = [MessageManager sharedInstance].sessionManager;

    [sessionManager GET:uri
        parameters:nil
        success:^(NSURLSessionDataTask *_Nonnull task, id _Nonnull responseObject) {
          if (successBlock && responseObject && [responseObject isKindOfClass:[NSDictionary class]])
          {
              NSMutableArray *arr = [NSMutableArray array];
              NSError *error = nil;

              for (NSDictionary *questionDict in responseObject[@"items"])
                  [arr addObject:[[QuestionItem alloc] initWithDictionary:questionDict error:&error]];

              if (error && failBlock)
                  failBlock(error);
              else
                  successBlock([NSArray arrayWithArray:arr]);
          }
          else if (failBlock)
          {
              failBlock([MessageManager sharedInstance].wrongJSONError);
          }

        }
        failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
          //Show alert  NSLog(@"%@", error);

          if (failBlock)
              failBlock(error);
        }];
}

+ (void)getAnswersForQuestionID:(NSInteger)questionID successBlock:(void (^)(NSArray *answers))successBlock failBlock:(void (^)(NSError *error))failBlock
{
    NSString *uri = [NSString stringWithFormat:@"questions/%ld/answers?order=desc&sort=votes&site=stackoverflow&filter=!LokMss6Ue_YTK90jsLeC0i", (long)questionID];

    AFHTTPSessionManager *sessionManager = [MessageManager sharedInstance].sessionManager;

    [sessionManager GET:uri
        parameters:nil
        success:^(NSURLSessionDataTask *_Nonnull task, id _Nonnull responseObject) {
          if (successBlock && responseObject && [responseObject isKindOfClass:[NSDictionary class]])
          {
              NSMutableArray *arr = [NSMutableArray array];
              NSError *error = nil;

              for (NSDictionary *answerDict in responseObject[@"items"])
                  [arr addObject:[[AnswerItem alloc] initWithDictionary:answerDict error:&error]];

              if (error && failBlock)
                  failBlock(error);
              else
                  successBlock([NSArray arrayWithArray:arr]);
          }
          else if (failBlock)
          {
              failBlock([MessageManager sharedInstance].wrongJSONError);
          }

        }
        failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
          //Show alert  NSLog(@"%@", error);

          if (failBlock)
              failBlock(error);
        }];
}

@end
