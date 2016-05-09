//
//  ViewController.m
//  catchbeta
//
//  Created by Brian Clouser on 4/27/16.
//  Copyright © 2016 Clouser. All rights reserved.
//

#import "ViewController.h"
#import "FishView.h"
#import "ProfileView.h"

@interface ViewController () <UIScrollViewDelegate, FishViewDelegate, ProfileViewDelegate>


@property (weak, nonatomic) IBOutlet UIImageView *halfMileBouy;
@property (weak, nonatomic) IBOutlet UIImageView *boat;
@property (weak, nonatomic) IBOutlet UIImageView *profilePic;

@property (weak, nonatomic) IBOutlet UIView *oceanView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) NSMutableArray *fishes;
@property (strong, nonatomic) NSArray *facePics;
@property (strong, nonatomic) NSArray *fishPics;
@property (nonatomic) CGFloat fishWidth;
@property (nonatomic) CGFloat fishHeight;

@property (strong, nonatomic) ProfileView *profile;

@property (strong, nonatomic) NSLayoutConstraint *profileHeight;
@property (strong, nonatomic) NSLayoutConstraint *profileWidth;

@property (strong, nonatomic) NSLayoutConstraint *boatTopConstaint;
@property (strong, nonatomic) NSLayoutConstraint *boatLeftConstraint;

@property (assign, nonatomic) CGFloat zoomScaleFloat;

@property (weak, nonatomic) IBOutlet UIImageView *sun;
@property (assign, nonatomic) BOOL zoomingBool;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//     [self setUpOceanGradient];
    
    self.scrollView.delegate = self;
    [self.oceanView addSubview:self.halfMileBouy];
    [self.oceanView addSubview:self.boat];
    [self.oceanView addSubview:self.profilePic];
    [self.oceanView addSubview:self.sun];
    [self.boat addSubview:self.profilePic];
    
    [self.boat setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.sun setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.profilePic setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [self.boat.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:10].active = YES;

//    [self.boat.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:50].active = YES;
    
    [self.sun.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-20].active = YES;
    [self.profilePic.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:45].active = YES;
    
    self.zoomScaleFloat = self.scrollView.zoomScale;
    

    

    
    
    
    

    
   
}

-(void)viewDidAppear:(BOOL)animated
{
    
    self.oceanView.translatesAutoresizingMaskIntoConstraints = NO;
    

    
    [self setUpFishViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView


{
//    float zoomNumber = self.scrollView.zoomScale;
    

    
    NSLog(@"ZOOMING BOOL %d", self.zoomingBool);
    
    [self.boat.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:0].active = NO;
    
    NSLog(@"THIS IS THE ZOOM SCALE %f", self.zoomScaleFloat);
//
//    [self.boat.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:10 + self.scrollView.contentOffset.x].active = NO;
    
    return self.oceanView;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale {
    
    
    NSLog(@"ZOOMING BOOL %d", self.zoomingBool);
    
    
}



 - (void)scrollViewDidScroll:(UIScrollView *)sender {
     
         
         if (self.scrollView.contentOffset.x > 0 || self.scrollView.contentOffset.x < 0) {
             
             NSLog(@"%f", self.scrollView.contentOffset.x);
             
             NSLog(@"GETTING INTO THE X OFFSET");
             
             [self.boat.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:10 + self.scrollView.contentOffset.x].active = NO;
             
             //         [self.boat setTranslatesAutoresizingMaskIntoConstraints:NO];
             [self.boat.leftAnchor constraintEqualToAnchor:self.scrollView.leftAnchor constant:10 + self.scrollView.contentOffset.x].active = YES;
             [self.sun.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant: -20 + self.scrollView.contentOffset.x].active = YES;
                 [self.profilePic.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:50 + self.scrollView.contentOffset.x].active = YES;
             
         }
         
         if (self.scrollView.contentOffset.y > 0 || self.scrollView.contentOffset.y < 0) {
             
             NSLog(@"GETTING INTO THE Y OFFSET");
             
             
             [self.boat.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:50 - self.scrollView.contentOffset.y].active = NO;
         }
         
         NSLog(@"THIS IS WORKING");

 
     
     
     
 }





-(void)setUpFishViews
{

    self.facePics = @[ @"ana", @"christine", @"courtney", @"katie", @"katie2", @"laura", @"mikayla" ];
    
//    self.fishPics = @[ @"greenFish", @"orangeFish", @"purpleFish", @"redFish", @"yellowFish"];
    
        self.fishPics = @[ @"fishTestRight", @"fishTestRight", @"fishTestRight", @"fishTestRight", @"fishTestRight"];
    
    self.fishHeight = 20;
    self.fishWidth = 40;
    
    

    
    [self addFishToOcean];
    
    
    
}

-(void)animateView: (FishView *)fishView
{

    
    if (fishView.frame.origin.x == fishView.startingX)
    {
        
//        NSLog(@"in the if");
        
        CGFloat randomXMove = 50;
        CGFloat randomYMove = 0;
        
        CGFloat xPosition = fishView.frame.origin.x + randomXMove;
        CGFloat yPosition = fishView.frame.origin.y + randomYMove;
        
        if (xPosition < 0 || xPosition > self.oceanView.frame.size.width)
        {
            xPosition = fishView.frame.origin.x - randomXMove - randomXMove;
        }
        else if (yPosition < 0 || yPosition > self.oceanView.frame.size.height)
        {
            yPosition = fishView.frame.origin.y - randomYMove - randomYMove;
        }
        
        
        NSUInteger time = arc4random_uniform(10);
        
        [UIView animateWithDuration:time + 5 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            
            [fishView.fishImage setImage:[UIImage imageNamed:@"fishTestRight"]];
            
            fishView.frame = CGRectMake(xPosition, yPosition, self.fishWidth, self.fishHeight);
            
            
        } completion:^(BOOL finished) {
            
            [self animateView:fishView];
            
        }];
        
        
    }
    
    else
    {
        
//         NSLog(@"in the else");
        
         NSUInteger time = arc4random_uniform(5);
    
        
        [UIView animateWithDuration:time + 5 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            
            [fishView.fishImage setImage:[UIImage imageNamed:@"fishTestLeft"]];
            
            fishView.frame = CGRectMake(fishView.startingX, fishView.startingY, self.fishWidth, self.fishHeight);
            
            
        } completion:^(BOOL finished) {
            
            [self animateView:fishView];
            
        }];

    }
    

    
}

//-(void)setUpOceanGradient
//{
//    
//    self.oceanView.layer.masksToBounds = YES;
//    
//    UIColor *color = [UIColor blackColor];
//    
//    //self.oceanView.backgroundColor = color;
//    
//    CAGradientLayer *gradientBg = [CAGradientLayer layer];
//    gradientBg.frame = self.oceanView.frame;
//    gradientBg.frame = self.oceanView.bounds;
//    gradientBg.colors = [NSArray arrayWithObjects:
//                         (id)color.CGColor,
//                         (id)[UIColor blueColor].CGColor,
//                         nil];
//    // vertical gradient
//    gradientBg.locations = [NSArray arrayWithObjects:
//                            [NSNumber numberWithFloat:0.0f],
//                            [NSNumber numberWithFloat:1.0f],
//                            nil];
//    
//    // gradient background
//    CALayer *layer = self.oceanView.layer;
//    layer.masksToBounds = YES;
//    [layer insertSublayer:gradientBg atIndex:0];
//}


-(void)addFishToOcean
{
    
    for (NSUInteger i = 0; i<= 500; i++)
    {
        CGFloat maxX = self.oceanView.frame.size.width - 100;
        CGFloat maxY = self.oceanView.frame.size.height - 100;
        
        CGFloat xPosition = arc4random_uniform(maxX);
        CGFloat yPosition = arc4random_uniform(maxY);
        
        NSUInteger faceIndex = i%7;
//        NSUInteger fishIndex = i%5;
    
        FishView *newFish = [[FishView alloc] initWithFrame:CGRectMake(xPosition, yPosition + 50, self.fishWidth, self.fishHeight )];
        
        newFish.delegate = self;
        
        newFish.facePicture.image = [UIImage imageNamed: self.facePics[faceIndex]];
        newFish.fishImage.image = [UIImage imageNamed:@"fishTestLeft"];
        
        newFish.startingX = xPosition;
        newFish.startingY = yPosition + 50;

        [self.oceanView addSubview:newFish];
        
//        NSUInteger colorNumber = arc4random_uniform(6);
        
        //newFish.backgroundColor = [self colorFromInteger:colorNumber];
        
        if (i <1000)
        {
            [self animateView:newFish];
        }
    
    }
    
//    NSLog(@"Done BUILDING FISHESSSS\n\n\n\n\n\n");
    
}


//-(UIColor *)colorFromInteger:(NSUInteger)number
//{
//    
//    if (number == 0)
//    {
//        return [UIColor blueColor];
//    }
//    
//    else if (number == 1)
//    {
//        return [UIColor redColor];
//    }
//    
//    else if (number == 2)
//    {
//        return [UIColor orangeColor];
//    }
//    
//    else if (number == 3)
//    {
//        return [UIColor yellowColor];
//    }
//    
//    else if (number == 4)
//    {
//        return [UIColor grayColor];
//    }
//    
//    else if (number == 5)
//    {
//        return [UIColor greenColor];
//    }
//    
//    else
//    {
//        return [UIColor blackColor];
//    }
//    
//}

-(void)fishtapped:(Person *)person
{
    
    [self launchProfileView];
    
    
}

-(void)cancelTapped
{
    [self leaveProfileView];
}




-(void)launchProfileView
{
    
    self.profile = [[ProfileView alloc] init];
    
    [self.view addSubview:self.profile];
    
    self.profile.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.profile.centerXAnchor  constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.profile.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    
    self.profileHeight = [self.profile.heightAnchor constraintEqualToConstant:5];
    self.profileWidth = [self.profile.widthAnchor constraintEqualToConstant:5];
    
    self.profileHeight.active = YES;
    self.profileWidth.active = YES;
    
    //self.profile.layer.cornerRadius = 50;
    
    
    [UIView animateWithDuration:.2 animations:^{
        
        self.profileWidth.active = NO;
        self.profileHeight.active = NO;
        
        self.profileWidth = [self.profile.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:.95 constant:0];
        self.profileHeight = [self.profile.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:.95 constant:0];
        
        self.profileWidth.active = YES;
        self.profileHeight.active = YES;
        
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
        self.profile.delegate = self;
        
    }];
    
    
    
    
}

-(void)leaveProfileView
{
    
    [UIView animateWithDuration:.2 animations:^{
        
        self.profileWidth.active = NO;
        self.profileHeight.active = NO;
        
        self.profileWidth = [self.profile.widthAnchor constraintEqualToConstant:5];
                             
        self.profileHeight = [self.profile.heightAnchor constraintEqualToConstant:5];
        
        
        self.profileWidth.active = YES;
        self.profileHeight.active = YES;
        
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
        [self.profile removeFromSuperview];
        
    }];
    
}












@end
