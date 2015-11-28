//
//  DetailViewController.m
//  StackOverFlow
//
//  Created by Sergei Prikhodko on 24.11.15.
//  Copyright © 2015 Sergei Prikhodko. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (strong, nonatomic) QuestionItem *question;

@end

@implementation DetailViewController

- (void)configureView
{
    // Update the user interface for the detail item.
    if (_question)
    {
        self.detailDescriptionLabel.text = [_question.body_markdown description];

        _textView.translatesAutoresizingMaskIntoConstraints = NO;
        NSString *htmlString = [self.question.body_markdown description];
        NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
        _textView.attributedText = attributedString;
    }
    else
    {
        self.detailDescriptionLabel.text = @"Nothing to show";
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Public methods

- (void)showAnswersForQuestion:(QuestionItem *)question
{
    self.question = question;

    // Update the view.
    [self configureView];
}

@end
