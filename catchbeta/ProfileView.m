//
//  ProfileView.m
//  catchbeta
//
//  Created by Brian Clouser on 5/4/16.
//  Copyright © 2016 Clouser. All rights reserved.
//

#import "ProfileView.h"
#import "MutualFriendView.h"

@interface ProfileView ()

@property (strong, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet UILabel *nameAndAgeLabel;
@property (weak, nonatomic) IBOutlet UILabel *hometownLabel;
@property (weak, nonatomic) IBOutlet UILabel *collegeAndGraduationYearLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobAndTitleLabel;
@property (weak, nonatomic) IBOutlet UITextView *aboutMeText;
@property (weak, nonatomic) IBOutlet MutualFriendView *friend1;
@property (weak, nonatomic) IBOutlet MutualFriendView *friend2;
@property (weak, nonatomic) IBOutlet MutualFriendView *friend3;
@property (weak, nonatomic) IBOutlet MutualFriendView *friend4;
@property (weak, nonatomic) IBOutlet MutualFriendView *friend5;
@property (weak, nonatomic) IBOutlet MutualFriendView *friend6;
@property (weak, nonatomic) IBOutlet MutualFriendView *friend7;

@end

@implementation ProfileView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self commonInit];
    }
    
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        [self commonInit];
    }
    
    return self;
}

-(void)commonInit
{
    
    
    [[NSBundle mainBundle] loadNibNamed:@"Profile" owner:self options:nil];
    
    [self addSubview:self.contentView];
    
    self.contentView.frame = self.bounds;
    
    
    self.aboutMeText.text = @"Hi there!\n\nI just moved to NY after 6 years in LA.  I'm just here looking for a partner in crime to show me around the city!\n\nLive in west village, love trying new restaurants, bars, and live music.";
    
    self.friend1.nameLabel.text = @"Brian";
    self.friend2.nameLabel.text = @"Jamie";
    self.friend3.nameLabel.text = @"Rosie";
    self.friend4.nameLabel.text = @"Angelica";
    self.friend5.nameLabel.text = @"Gabe";
    self.friend6.nameLabel.text = @"Nick";
    self.friend7.nameLabel.text = @"Seth";
    
    
    self.friend1.friendPicture.image = [UIImage imageNamed:@"brian"];
    self.friend2.friendPicture.image = [UIImage imageNamed:@"jamie"];
    self.friend3.friendPicture.image = [UIImage imageNamed:@"rosie"];
    self.friend4.friendPicture.image = [UIImage imageNamed:@"angelica"];
    self.friend5.friendPicture.image = [UIImage imageNamed:@"gabe"];
    self.friend6.friendPicture.image = [UIImage imageNamed:@"nick"];
    self.friend7.friendPicture.image = [UIImage imageNamed:@"seth"];
    
    
}
- (IBAction)cancelTapped:(id)sender
{
    
    NSLog(@"this is happeing");
    
    [self.delegate cancelTapped];
    
}

@end
