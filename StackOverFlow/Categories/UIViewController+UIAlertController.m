//
//  UIViewController+UIAlertController.m
//  StackOverFlow
//
//  Created by Sergei Prikhodko on 30.11.15.
//  Copyright © 2015 Sergei Prikhodko. All rights reserved.
//

#import "UIViewController+UIAlertController.h"

@implementation UIViewController (UIAlertController)

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message
{
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title
                                                                        message:message
                                                                 preferredStyle:UIAlertControllerStyleAlert];

    [controller addAction:[UIAlertAction actionWithTitle:@"Dismiss"
                                                   style:UIAlertActionStyleDestructive
                                                 handler:nil]];

    __weak typeof(self) welf = self;
    dispatch_async(dispatch_get_main_queue(), ^{

      [welf presentViewController:controller animated:YES completion:nil];
    });
}

- (void)showAlertWithError:(NSError *)error
{
    [self showAlertWithTitle:@"Error!" message:error.localizedDescription];
}

@end
