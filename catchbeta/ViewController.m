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
#import "WhiteWhaleView.h"

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
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *oceanTapGestureRecognizer;



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
    
    
    
    
    

    
   
}

-(void)viewDidAppear:(BOOL)animated
{
    
    self.oceanView.translatesAutoresizingMaskIntoConstraints = NO;
    
     self.profile = [[ProfileView alloc] init];
    
    [self setUpFishViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{

    return self.oceanView;
}





-(void)setUpFishViews
{

    self.facePics = @[ @"ana", @"christine", @"courtney", @"katie", @"katie2", @"laura", @"mikayla" ];
    self.fishPics = @[ @"fishTestRight", @"fishTestRight", @"fishTestRight", @"fishTestRight", @"fishTestRight"];
    
    self.fishHeight = 20;
    self.fishWidth = 40;
    
    [self addFishToOcean];
    
}
- (IBAction)oceanTapped:(id)sender
{
    
    CGPoint locationOfTap = [self.oceanTapGestureRecognizer locationInView:self.oceanView];
    
    CGFloat x = locationOfTap.x;
    CGFloat y = locationOfTap.y;
    
    FishView *tappedFish = [self fishTappedAtLocation:x y:y];
    
    if (tappedFish)
    {
        [self launchProfileView];
    }
}


-(FishView *)fishTappedAtLocation:(CGFloat)x y:(CGFloat)y
{
    
    NSArray *oceanSubviews = [self.oceanView subviews];
    NSMutableArray *allFish = [[NSMutableArray alloc] init];
    
    for (UIView *view in oceanSubviews)
    {
        if ([view isKindOfClass:[FishView class]])
        {
            [allFish addObject:view];
        }
    }
    
    for (FishView *fish in allFish)
    {
       
        CGFloat currentX = [[fish.layer presentationLayer] frame].origin.x;
        CGFloat currentY = [[fish.layer presentationLayer] frame].origin.y;
        CGFloat height = fish.frame.size.height;
        CGFloat width = fish.frame.size.width;
        
      BOOL isInFrame = [self fishFrame:currentX y:currentY width:width height:height tapLocationX:x tapLocationY:y];
        
        
        if (isInFrame)
        {
            
            return fish;
            
            break;
        }
  
     }
    
    return nil;
    
}

-(BOOL)fishFrame:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height tapLocationX:(CGFloat)tapLocationX tapLocationY:(CGFloat)tapLocationY
{
    
    BOOL xInRange = tapLocationX >= x && tapLocationX <= x + width;
    BOOL yInRange = tapLocationY >= y && tapLocationY <= y + height;
    
    BOOL inRange = xInRange && yInRange;
    
    return inRange;

}

-(void)animateView: (FishView *)fishView
{
    
    if (fishView.frame.origin.x == fishView.startingX)
    {
        
    
    
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
        
        
         NSUInteger time = arc4random_uniform(5);
    
        
        [UIView animateWithDuration:time + 5 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            
            [fishView.fishImage setImage:[UIImage imageNamed:@"fishTestLeft"]];
            
            fishView.frame = CGRectMake(fishView.startingX, fishView.startingY, self.fishWidth, self.fishHeight);
            
            
        } completion:^(BOOL finished) {
            
            [self animateView:fishView];
            
        }];

    }
    

    
}





-(void)addFishToOcean
{
    
    for (NSUInteger i = 0; i<= 300; i++)
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
        
        NSUInteger colorNumber = arc4random_uniform(6);
        
        //newFish.backgroundColor = [self colorFromInteger:colorNumber];
        
        if (i <500)
        {
            [self animateView:newFish];
        }
    
    }
    
    CGFloat maxX = self.oceanView.frame.size.width - 100;
    CGFloat maxY = self.oceanView.frame.size.height - 100;
    
    CGFloat xPosition = arc4random_uniform(maxX);
    CGFloat yPosition = arc4random_uniform(maxY);
    
    WhiteWhaleView *whale = [[WhiteWhaleView alloc] initWithFrame:CGRectMake(xPosition, yPosition, 120, 60)];
    
    [self.oceanView addSubview:whale];
    
    
    NSLog(@"Done BUILDING FISHESSSS\n\n\n\n\n\n");
     
}




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
    self.oceanTapGestureRecognizer.enabled = NO;
    
    [self.profile hideAllContent];
    
    [self.view addSubview:self.profile];
    
    self.profile.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.profile.centerXAnchor  constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.profile.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    
    self.profileHeight = [self.profile.heightAnchor constraintEqualToConstant:5];
    self.profileWidth = [self.profile.widthAnchor constraintEqualToConstant:5];
    
    self.profileHeight.active = YES;
    self.profileWidth.active = YES;
    
    
    
    [self.view layoutIfNeeded];
    
    
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
        
        self.view.userInteractionEnabled = YES;
        
        [self.profile showAllContent];
        
        self.profile.layer.cornerRadius = 50;
        
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
        
        self.oceanTapGestureRecognizer.enabled = YES;
        
    }];
    
}












@end
