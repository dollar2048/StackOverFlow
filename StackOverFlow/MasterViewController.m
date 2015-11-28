//
//  MasterViewController.m
//  StackOverFlow
//
//  Created by Sergei Prikhodko on 24.11.15.
//  Copyright © 2015 Sergei Prikhodko. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "MessageManager.h"
#import "QuestionItem.h"
#import "QuestionTableViewCell.h"

@interface MasterViewController () <UISearchBarDelegate>
@property (strong, nonatomic) NSMutableArray *questions;
@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    //    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    //    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    [self dummy];
}

- (void)dummy
{
    NSString *keyWord = @"window";

    __weak typeof(self) welf = self;

    [MessageManager getQuestionsForKeyWord:keyWord
        successBlock:^(NSArray *questions) {
          [welf updateWithQuestions:questions];
        }
        failBlock:^(NSError *error) {
          NSLog(@"%@", error);
        }];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateWithQuestions:(NSArray *)questions
{
    if (questions.count)
    {
        self.questions = [questions mutableCopy];
        [self.tableView reloadData];

        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                                    animated:YES
                              scrollPosition:UITableViewScrollPositionTop];
    }
    else
    {
        [_questions removeAllObjects];
        [self.tableView reloadData];

        NSLog(@"No Results");
    }

    [self showDetailViewData];
}

- (void)showDetailViewData
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    QuestionItem *question = _questions.count ? self.questions[indexPath.row] : nil;
    [_detailViewController showAnswersForQuestion:question];

    //    _detailViewController.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    //    _detailViewController.navigationItem.leftItemsSupplementBackButton = YES;
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        QuestionItem *question = self.questions[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [_detailViewController showAnswersForQuestion:question];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.questions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuestionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    QuestionItem *question = self.questions[indexPath.row];
    [cell showQuestion:question];

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.questions removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];

    NSString *keyWord = searchBar.text;

    __weak typeof(self) welf = self;

    [MessageManager getQuestionsForKeyWord:keyWord
        successBlock:^(NSArray *questions) {

          dispatch_async(dispatch_get_main_queue(), ^{
            [welf updateWithQuestions:questions];
          });

        }
        failBlock:^(NSError *error) {
          NSLog(@"%@", error);
        }];
}

@end
