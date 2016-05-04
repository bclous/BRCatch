//
//  mutualFriendView.m
//  catchbeta
//
//  Created by Brian Clouser on 5/4/16.
//  Copyright © 2016 Clouser. All rights reserved.
//

#import "MutualFriendView.h"

@interface MutualFriendView ()

@property (strong, nonatomic) IBOutlet UIView *contentView;



@end

@implementation MutualFriendView

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
    
    
    [[NSBundle mainBundle] loadNibNamed:@"MutualFriend" owner:self options:nil];
    
    [self addSubview:self.contentView];
    
    self.contentView.frame = self.bounds;
    
    self.friendPicture.layer.cornerRadius = 25;
    
}


@end
