//
//  QuestionTableViewCell.m
//  StackOverFlow
//
//  Created by Sergei Prikhodko on 27.11.15.
//  Copyright © 2015 Sergei Prikhodko. All rights reserved.
//

#import "QuestionTableViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "AppUtils.h"

@interface QuestionTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *creationDate;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;

@end

@implementation QuestionTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)showQuestion:(QuestionItem *)question
{
    self.title.text = question.title;
    self.creationDate.text = [AppUtils stringFromDate:question.creation_date];
    [self.profileImage setImageWithURL:question.owner.profile_image placeholderImage:[UIImage imageNamed:@"profile-image-placeholder"]];
    self.authorLabel.text = question.owner.display_name;
}

@end
