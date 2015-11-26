//
//  QuestionTableViewCell.h
//  StackOverFlow
//
//  Created by Sergei Prikhodko on 27.11.15.
//  Copyright © 2015 Sergei Prikhodko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionItem.h"

@interface QuestionTableViewCell : UITableViewCell

- (void)showQuestion:(QuestionItem *)question;

@end
