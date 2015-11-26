//
//  QuestionTableViewCell.m
//  StackOverFlow
//
//  Created by Sergei Prikhodko on 27.11.15.
//  Copyright © 2015 Sergei Prikhodko. All rights reserved.
//

#import "QuestionTableViewCell.h"
#import "UIImageView+AFNetworking.h"

@interface QuestionTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *creationDate;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
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

-(void)prepareForReuse
{
    self.imageView.image = nil;
}

- (void)showQuestion:(QuestionItem *)question
{
    self.title.text = question.title;
    self.creationDate.text = question.creation_date.description;
    [self.profileImage setImageWithURL:question.owner.profile_image placeholderImage:[UIImage imageNamed:@"profile-image-placeholder"]];
}

@end
