//
//  DetailViewController.h
//  StackOverFlow
//
//  Created by Sergei Prikhodko on 24.11.15.
//  Copyright © 2015 Sergei Prikhodko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionItem.h"

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (strong, readonly, nonatomic) QuestionItem *question;

- (void)showAnswersForQuestion:(QuestionItem *)question;

@end
