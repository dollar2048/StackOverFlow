//
//  AnswerTableViewCell.m
//  StackOverFlow
//
//  Created by Sergei Prikhodko on 28.11.15.
//  Copyright © 2015 Sergei Prikhodko. All rights reserved.
//

#import "AnswerTableViewCell.h"

@interface AnswerTableViewCell ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;

@end

@implementation AnswerTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)commentButtonPresed:(id)sender
{
}

#pragma mark - Public methods

- (void)showAnswer:(AnswerItem *)answer
{
    [self.webView loadHTMLString:answer.body baseURL:nil];
}

@end
