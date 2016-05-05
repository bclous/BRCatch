//
//  Person.h
//  catchbeta
//
//  Created by Brian Clouser on 5/4/16.
//  Copyright © 2016 Clouser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (strong, nonatomic) NSString *occupation;
@property (strong, nonatomic) NSString *college;
@property (strong, nonatomic) NSString *homeTown;
@property (nonatomic) BOOL isMale;
@property (strong, nonatomic) NSString *aboutMe;
@property (strong, nonatomic) NSMutableArray *pictureNames;
@property (strong, nonatomic) NSString *name;
@property (nonatomic) NSUInteger age;

@end
