//
//  DetailViewController.m
//  StackOverFlow
//
//  Created by Sergei Prikhodko on 29.11.15.
//  Copyright © 2015 Sergei Prikhodko. All rights reserved.
//

#import "DetailViewController.h"
#import "MessageManager.h"
#import "AnswerItem.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *questionWebView;

@property (weak, nonatomic) IBOutlet UIWebView *answerWebView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *prevButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *answerNumberBarButtonItem;

@property (weak, nonatomic) IBOutlet UIButton *commentsButton;
@property (strong, nonatomic) QuestionItem *question;

@property (assign, nonatomic) NSInteger selectedAnswer;

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)configureView
{
    [_questionWebView loadHTMLString:_question.title baseURL:nil];

    if (_question.answers.count)
    {
        AnswerItem *answer = _question.answers[_selectedAnswer];
        [_answerWebView loadHTMLString:answer.body baseURL:nil];
    }
    else
    {
        [_answerWebView loadHTMLString:@"<center>No Answers</center>" baseURL:nil];
    }

    _answerNumberBarButtonItem.title = [NSString stringWithFormat:@"%ld/%ld", (long)_selectedAnswer + 1, (long)_question.answers.count];

    [self configurePrevNextButtonsForAnswers:_question.answers selected:_selectedAnswer];
    [self configureCommentsButtonForAnswers:_question.answers];
}

- (void)configurePrevNextButtonsForAnswers:(NSArray *)answers selected:(NSUInteger)selectedAnswer
{
    _prevButton.enabled = selectedAnswer > 0;
    _nextButton.enabled = selectedAnswer <= answers.count - 2;
}

- (void)configureCommentsButtonForAnswers:(NSArray *)answers
{
    if (answers.count)
    {
        AnswerItem *answer = answers[_selectedAnswer];

        _commentsButton.hidden = NO;
        _commentsButton.enabled = answer.comments.count;

        [_commentsButton setTitle:[NSString stringWithFormat:@"Comments: %ld", answer.comments.count] forState:UIControlStateNormal];
    }
    else
    {
        _commentsButton.hidden = YES;
    }
}

#pragma mark - Public methods

- (void)showAnswersForQuestion:(QuestionItem *)question
{
    self.question = question;

    self.selectedAnswer = 0;

    __weak typeof(self) welf = self;

    [MessageManager getAnswersForQuestionID:_question.question_id
        successBlock:^(NSArray *answers) {
          dispatch_async(dispatch_get_main_queue(), ^{
            welf.question.answers = answers;
            [welf configureView];
          });

        }
        failBlock:^(NSError *error) {
          NSLog(@"%@", error);
        }];

    [welf configureView];
}

- (IBAction)nextButtonPressed:(id)sender
{
    self.selectedAnswer += 1;
    [self configureView];
}

- (IBAction)prevButtonPressed:(id)sender
{
    self.selectedAnswer -= 1;
    [self configureView];
}

@end
