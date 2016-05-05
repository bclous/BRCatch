//
//  ProfileView.h
//  catchbeta
//
//  Created by Brian Clouser on 5/4/16.
//  Copyright © 2016 Clouser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@protocol ProfileViewDelegate <NSObject>

-(void)cancelTapped;

@end

@interface ProfileView : UIView

@property (strong, nonatomic) Person *person;
@property (weak, nonatomic) id <ProfileViewDelegate> delegate;

@end
