//
//  Fish.m
//  catchbeta
//
//  Created by Brian Clouser on 4/27/16.
//  Copyright © 2016 Clouser. All rights reserved.
//

#import "FishView.h"

@interface FishView ()

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *pictureTapGestureRecognizer;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *fishTapGestureRecognizer;



@end

@implementation FishView

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
    
    
    [[NSBundle mainBundle] loadNibNamed:@"RedFish" owner:self options:nil];
    
    [self addSubview:self.contentView];
    
    self.contentView.frame = self.bounds;
    
}









@end
