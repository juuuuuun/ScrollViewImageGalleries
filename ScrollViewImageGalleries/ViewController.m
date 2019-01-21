//
//  ViewController.m
//  ScrollViewImageGalleries
//
//  Created by Jun Oh on 2019-01-21.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.scrollView.delegate = self;
    
    UIImageView* firstImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    firstImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollView addSubview:firstImageView];
    
    firstImageView.image = [UIImage imageNamed:@"Lighthouse-in-Field"];
    firstImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [NSLayoutConstraint constraintWithItem:firstImageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:firstImageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:firstImageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:firstImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:firstImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0].active = YES;
    
    UIImageView* secondImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    secondImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollView addSubview:secondImageView];
    
    secondImageView.image = [UIImage imageNamed:@"Lighthouse-night"];
    secondImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [NSLayoutConstraint constraintWithItem:secondImageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:secondImageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:secondImageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:firstImageView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:secondImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:secondImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0].active = YES;
    
    UIImageView* thirdImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    thirdImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollView addSubview:thirdImageView];
    
    thirdImageView.image = [UIImage imageNamed:@"Lighthouse"];
    thirdImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [NSLayoutConstraint constraintWithItem:thirdImageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:thirdImageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:thirdImageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:secondImageView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:thirdImageView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:thirdImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:thirdImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0].active = YES;
    
    self.scrollView.pagingEnabled = YES;
    
    [self.view addSubview:self.scrollView];
    
}



@end
