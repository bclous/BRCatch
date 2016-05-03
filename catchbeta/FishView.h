//
//  Fish.h
//  catchbeta
//
//  Created by Brian Clouser on 4/27/16.
//  Copyright © 2016 Clouser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FishView : UIView

@property (nonatomic) CGFloat startingX;
@property (nonatomic) CGFloat startingY;

@property (weak, nonatomic) IBOutlet UIImageView *fishImage;
@property (weak, nonatomic) IBOutlet UIImageView *facePicture;

@end
