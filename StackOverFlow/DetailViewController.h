//
//  DetailViewController.h
//  StackOverFlow
//
//  Created by Sergei Prikhodko on 29.11.15.
//  Copyright © 2015 Sergei Prikhodko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionItem.h"

@interface DetailViewController : UIViewController

@property (strong, readonly, nonatomic) QuestionItem *question;

- (void)showAnswersForQuestion:(QuestionItem *)question;

@end