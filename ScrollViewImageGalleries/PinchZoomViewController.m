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
@property (nonatomic) UIView* hudFollowView;
@property (nonatomic) UIView* hudView;
@property (nonatomic) double oldZoomScale;
@end



@implementation PinchZoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.scrollView.delegate = self;
    
    UIImageView* firstImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    firstImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollView addSubview:firstImageView];
    
    firstImageView.image = self.senderImage;
    
    [NSLayoutConstraint constraintWithItem:firstImageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:firstImageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:firstImageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:firstImageView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0].active = YES;
    
    self.scrollView.minimumZoomScale = 0.1;
    self.scrollView.maximumZoomScale = 3.0;
    self.firstImageView = firstImageView;
    
    [self.scrollView zoomToRect:CGRectMake(0, 0, firstImageView.image.size.width, firstImageView.image.size.height) animated:YES];
    self.oldZoomScale = self.scrollView.zoomScale;
    
    UIView* hudView = [[UIView alloc] initWithFrame:CGRectZero];
    hudView.translatesAutoresizingMaskIntoConstraints = NO;
    hudView.backgroundColor = [UIColor grayColor];
    hudView.alpha = 0.3;
    [self.view addSubview:hudView];
    
    [NSLayoutConstraint constraintWithItem:hudView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:firstImageView attribute:NSLayoutAttributeWidth multiplier:0.1 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:hudView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:firstImageView attribute:NSLayoutAttributeHeight multiplier:0.1 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:hudView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:hudView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0].active = YES;
    
    UIView* hudFollowView = [[UIView alloc] initWithFrame:CGRectZero];
    hudFollowView.translatesAutoresizingMaskIntoConstraints = NO;
    hudFollowView.backgroundColor = [UIColor yellowColor];
    [hudView addSubview:hudFollowView];
    
    [NSLayoutConstraint constraintWithItem:hudFollowView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.1  constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:hudFollowView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.1 constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:hudFollowView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:hudView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0-self.view.bounds.size.height*0.1/2.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:hudFollowView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:hudView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0-self.view.bounds.size.width*0.1/2.0].active = YES;
    
    hudFollowView.layer.anchorPoint = CGPointMake(0, 0);
    self.hudFollowView = hudFollowView;
    self.hudView = hudView;
    
    [self transformHudFollowView:self.scrollView];
    
}

- (void)transformHudFollowView:(UIScrollView *)scrollView {
    CGAffineTransform zoomTransform = CGAffineTransformMakeScale(1 / scrollView.zoomScale, 1 / scrollView.zoomScale);
    CGAffineTransform translateTransform = CGAffineTransformMakeTranslation(scrollView.contentOffset.x * 0.1 / scrollView.zoomScale, scrollView.contentOffset.y * 0.1 / scrollView.zoomScale);
    self.hudFollowView.transform = CGAffineTransformConcat(zoomTransform, translateTransform);
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self transformHudFollowView:scrollView];
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    [self transformHudFollowView:scrollView];
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
