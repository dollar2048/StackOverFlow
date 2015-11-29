//
//  CommentsViewController.m
//  StackOverFlow
//
//  Created by Sergei Prikhodko on 24.11.15.
//  Copyright © 2015 Sergei Prikhodko. All rights reserved.
//

#import "CommentsViewController.h"
#import "AnswerTableViewCell.h"
#import "MessageManager.h"
#import "AnswerItem.h"

@interface CommentsViewController ()
@property (strong, nonatomic) AnswerItem *answer;
@end

@implementation CommentsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Public methods

- (void)showCommentsForAnser:(AnswerItem *)answer;
{
    self.answer = answer;

    __weak typeof(self) welf = self;

//    [MessageManager getAnswersForQuestionID:_question.question_id
//        successBlock:^(NSArray *answers) {
//          dispatch_async(dispatch_get_main_queue(), ^{
//            welf.question.answers = answers;
//            [welf configureView];
//          });
//
//        }
//        failBlock:^(NSError *error) {
//          NSLog(@"%@", error);
//        }];
//
//    [welf configureView];
}

#pragma mark - Table View

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
//{
//    return ((NSNumber *)_cellsHeighDict[@(indexPath.row)]).floatValue + 38;
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
//    return _question.answers..count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    AnswerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AnswerTableViewCell" forIndexPath:indexPath];
//    AnswerItem *answer = _question.answers[indexPath.row];
//    [cell showAnswer:answer];
//
//    return cell;
    return nil;
}

@end
