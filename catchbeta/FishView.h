//
//  Fish.h
//  catchbeta
//
//  Created by Brian Clouser on 4/27/16.
//  Copyright © 2016 Clouser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@protocol FishViewDelegate <NSObject>

-(void)fishtapped:(Person *)person;

@end

@interface FishView : UIView

@property (weak, nonatomic) id <FishViewDelegate> delegate;

@property (nonatomic) CGFloat startingX;
@property (nonatomic) CGFloat startingY;

@property (weak, nonatomic) IBOutlet UIImageView *fishImage;
@property (weak, nonatomic) IBOutlet UIImageView *facePicture;

@property (strong, nonatomic) Person *person;



@end
