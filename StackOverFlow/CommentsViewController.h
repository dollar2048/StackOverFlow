//
//  CommentsViewController.h
//  StackOverFlow
//
//  Created by Sergei Prikhodko on 24.11.15.
//  Copyright © 2015 Sergei Prikhodko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnswerItem.h"

@interface CommentsViewController : UITableViewController


- (void)showCommentsForAnser:(AnswerItem *)answer;

@end
