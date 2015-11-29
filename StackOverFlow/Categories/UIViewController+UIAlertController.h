//
//  UIViewController+UIAlertController.h
//  StackOverFlow
//
//  Created by Sergei Prikhodko on 30.11.15.
//  Copyright © 2015 Sergei Prikhodko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (UIAlertController)

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message;
- (void)showAlertWithError:(NSError *)error;

@end
