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

- (IBAction)closeButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Public methods

- (void)showCommentsForAnser:(AnswerItem *)answer;
{
    self.answer = answer;

    [self.tableView reloadData];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _answer.comments.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentTableViewCell" forIndexPath:indexPath];

    CommentItem *comment = _answer.comments[indexPath.row];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.text = comment.body;
    //    cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld", comment.score];

    return cell;
}

#pragma mark - Cell Setup

@end
