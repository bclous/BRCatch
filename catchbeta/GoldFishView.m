//
//  GoldFishView.m
//  catchbeta
//
//  Created by Brian Clouser on 5/10/16.
//  Copyright © 2016 Clouser. All rights reserved.
//

#import "GoldFishView.h"

@interface GoldFishView ()
@property (strong, nonatomic) IBOutlet UIView *contentView;

@end

@implementation GoldFishView


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
    
    
    [[NSBundle mainBundle] loadNibNamed:@"GoldFish" owner:self options:nil];
    
    [self addSubview:self.contentView];
    
    self.contentView.frame = self.bounds;
    
}

@end
