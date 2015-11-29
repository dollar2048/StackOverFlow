//
//  DetailViewControllerTests.m
//  StackOverFlow
//
//  Created by Sergei Prikhodko on 29.11.15.
//  Copyright © 2015 Sergei Prikhodko. All rights reserved.
//

#define HC_SHORTHAND

#import <XCTest/XCTest.h>
#import <OCHamcrest/OCHamcrest.h>
#import "DetailViewController.h"
#import "AnswerItem.h"

@interface DetailViewController (Tests)
@property (weak, nonatomic) IBOutlet UIWebView *questionWebView;

@property (weak, nonatomic) IBOutlet UIWebView *answerWebView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *prevButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *answerNumberBarButtonItem;

@property (weak, nonatomic) IBOutlet UIButton *commentsButton;
@property (strong, nonatomic) QuestionItem *question;

@property (assign, nonatomic) NSInteger selectedAnswer;

- (void)configureCountButtonsForAnswers:(NSArray *)answers selected:(NSUInteger)selectedAnswer;
- (void)configurePrevNextButtonsForAnswers:(NSArray *)answers selected:(NSUInteger)selectedAnswer;
- (void)configureCommentsButtonForAnswers:(NSArray *)answers selected:(NSUInteger)selectedAnswer;
- (IBAction)nextButtonPressed:(id)sender;
- (IBAction)prevButtonPressed:(id)sender;
@end

@interface DetailViewControllerTests : XCTestCase
@property (strong, nonatomic) DetailViewController *detailVC;
@end

@implementation DetailViewControllerTests

- (void)setUp
{
    [super setUp];

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.detailVC = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    [self.detailVC performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testEquals
{
    //    Biscuit* theBiscuit = [[Biscuit alloc] initWithName:@"Ginger"];
    //    Biscuit* myBiscuit = [[Biscuit alloc] initWithName:@"Ginger"];
    assertThat(@2, equalTo(@2));
}

- (void)testConfigureCountButtons
{
    NSArray *answers = @[];
    [_detailVC configureCountButtonsForAnswers:answers selected:0];
    assertThat(_detailVC.answerNumberBarButtonItem.title, equalTo(@""));

    answers = @[@1];
    [_detailVC configureCountButtonsForAnswers:answers selected:0];
    assertThat(_detailVC.answerNumberBarButtonItem.title, equalTo(@"1/1"));

    answers = @[@1, @2];
    [_detailVC configureCountButtonsForAnswers:answers selected:0];
    assertThat(_detailVC.answerNumberBarButtonItem.title, equalTo(@"1/2"));
    [_detailVC configureCountButtonsForAnswers:answers selected:1];
    assertThat(_detailVC.answerNumberBarButtonItem.title, equalTo(@"2/2"));
}

- (void)testConfigurePrevNextButtons
{
    NSArray *answers = @[];
    [_detailVC configurePrevNextButtonsForAnswers:answers selected:0];
    assertThatBool(_detailVC.prevButton.enabled, isFalse());
    assertThatBool(_detailVC.nextButton.enabled, isFalse());

    answers = @[@1];
    [_detailVC configurePrevNextButtonsForAnswers:answers selected:0];
    assertThatBool(_detailVC.prevButton.enabled, isFalse());
    assertThatBool(_detailVC.nextButton.enabled, isFalse());

    answers = @[@1, @2];
    [_detailVC configurePrevNextButtonsForAnswers:answers selected:0];
    assertThatBool(_detailVC.prevButton.enabled, isFalse());
    assertThatBool(_detailVC.nextButton.enabled, isTrue());
    [_detailVC configurePrevNextButtonsForAnswers:answers selected:1];
    assertThatBool(_detailVC.prevButton.enabled, isTrue());
    assertThatBool(_detailVC.nextButton.enabled, isFalse());
}

- (void)testConfigureCommentsButton
{
    NSArray *answers = @[];
    [_detailVC configureCommentsButtonForAnswers:answers selected:0];
    assertThatBool(_detailVC.commentsButton.hidden, isTrue());

    AnswerItem *answer = [AnswerItem new];
    answers = @[answer];
    [_detailVC configureCommentsButtonForAnswers:answers selected:0];
    assertThatBool(_detailVC.commentsButton.enabled, isFalse());
    assertThatBool(_detailVC.commentsButton.hidden, isFalse());
    assertThat(_detailVC.commentsButton.titleLabel.text, equalTo(@"Comments: 0"));

    answer.comments = @[([CommentItem new])];
    answers = @[answer];
    [_detailVC configureCommentsButtonForAnswers:answers selected:0];
    assertThatBool(_detailVC.commentsButton.enabled, isTrue());
    assertThatBool(_detailVC.commentsButton.hidden, isFalse());

    answers = @[];
    [_detailVC configureCommentsButtonForAnswers:answers selected:0];
    assertThatBool(_detailVC.commentsButton.enabled, isTrue());
}

- (void)testNextButtonPressed
{
    NSArray *answers = @[];
    QuestionItem *question = [QuestionItem new];
    question.answers = answers;
    _detailVC.question = question;
    _detailVC.selectedAnswer = 0;

    [_detailVC nextButtonPressed:nil];
    assertThatBool(_detailVC.prevButton.enabled, isFalse());
    assertThatBool(_detailVC.nextButton.enabled, isFalse());
}

- (void)testExample
{
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample
{
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
