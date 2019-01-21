//
//  PinchZoomViewController.m
//  ScrollViewImageGalleries
//
//  Created by Jun Oh on 2019-01-21.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import "PinchZoomViewController.h"

@interface PinchZoomViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic) UIImageView* firstImageView;

@end

@implementation PinchZoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.scrollView.delegate = self;
    
    UIImageView* firstImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    firstImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollView addSubview:firstImageView];
    
    firstImageView.image = [UIImage imageNamed:@"Lighthouse-in-Field"];
    
    [NSLayoutConstraint constraintWithItem:firstImageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:firstImageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:firstImageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:firstImageView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0].active = YES;
    
    self.scrollView.minimumZoomScale = 0.25;
    self.scrollView.maximumZoomScale = 3.0;
    self.firstImageView = firstImageView;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.firstImageView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
