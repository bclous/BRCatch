//
//  ViewController.m
//  catchbeta
//
//  Created by Brian Clouser on 4/27/16.
//  Copyright © 2016 Clouser. All rights reserved.
//

#import "ViewController.h"
#import "FishView.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *halfMileBouy;
@property (weak, nonatomic) IBOutlet UIView *oceanView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) NSMutableArray *fishes;
@property (strong, nonatomic) NSArray *facePics;
@property (strong, nonatomic) NSArray *fishPics;
@property (nonatomic) CGFloat fishWidth;
@property (nonatomic) CGFloat fishHeight;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//     [self setUpOceanGradient];
    
    self.scrollView.delegate = self;
    [self.oceanView addSubview:self.halfMileBouy];
    
    

    
   
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

    return self.oceanView;
}





-(void)setUpFishViews
{

    self.facePics = @[ @"ana", @"christine", @"courtney", @"katie", @"katie2", @"laura", @"mikayla" ];
    
//    self.fishPics = @[ @"greenFish", @"orangeFish", @"purpleFish", @"redFish", @"yellowFish"];
    
        self.fishPics = @[ @"redFish", @"redFish", @"redFish", @"redFish", @"redFish"];
    
    self.fishHeight = 20;
    self.fishWidth = 40;
    
    

    
    [self addFishToOcean];
    
    
    
}

-(void)animateView: (FishView *)fishView
{

    
    if (fishView.frame.origin.x == fishView.startingX)
    {
        
        NSLog(@"in the if");
        
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
        
        
        NSUInteger time = arc4random_uniform(5);
        
        [UIView animateWithDuration:time + 5 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            
            fishView.frame = CGRectMake(xPosition, yPosition, self.fishWidth, self.fishHeight);
            
            
        } completion:^(BOOL finished) {
            
            [self animateView:fishView];
            
        }];
        
        
    }
    
    else
    {
        
         NSLog(@"in the else");
        
         NSUInteger time = arc4random_uniform(5);
        
        [UIView animateWithDuration:time + 5 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            
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
        NSUInteger fishIndex = i%5;
    
        FishView *newFish = [[FishView alloc] initWithFrame:CGRectMake(xPosition, yPosition + 50, self.fishWidth, self.fishHeight )];
        
        newFish.facePicture.image = [UIImage imageNamed: self.facePics[faceIndex]];
        newFish.fishImage.image = [UIImage imageNamed:self.fishPics[fishIndex]];
        
        newFish.startingX = xPosition;
        newFish.startingY = yPosition + 50;

        [self.oceanView addSubview:newFish];
        
        NSUInteger colorNumber = arc4random_uniform(6);
        
        //newFish.backgroundColor = [self colorFromInteger:colorNumber];
        
        if (i <1000)
        {
            [self animateView:newFish];
        }
    
    }
    
    NSLog(@"Done BUILDING FISHESSSS\n\n\n\n\n\n");
    
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









@end
