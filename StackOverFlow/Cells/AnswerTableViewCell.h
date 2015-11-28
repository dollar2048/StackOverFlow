//
//  AnswerTableViewCell.h
//  StackOverFlow
//
//  Created by Sergei Prikhodko on 28.11.15.
//  Copyright © 2015 Sergei Prikhodko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnswerItem.h"

@interface AnswerTableViewCell : UITableViewCell

- (void)showAnswer:(AnswerItem *)answer;

@end
