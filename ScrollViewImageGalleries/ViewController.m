//
//  ViewController.m
//  ScrollViewImageGalleries
//
//  Created by Jun Oh on 2019-01-21.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import "ViewController.h"
#import "PinchZoomViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


@end

@implementation ViewController



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    PinchZoomViewController* pinchZoomViewController = [segue destinationViewController];
    
    UIImageView* senderImageView = sender;
    pinchZoomViewController.senderImage = senderImageView.image;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    for(int i = 0; i < self.pageControl.numberOfPages; i++) {
        if(scrollView.bounds.origin.x >= self.view.frame.size.width*i &&
           scrollView.bounds.origin.x < self.view.frame.size.width*(i+1)) {
            self.pageControl.currentPage = i;
            break;
        }
    }
    
}

- (void) pageClicked:(UIPageControl *)sender {
    [self.scrollView scrollRectToVisible:CGRectMake(self.view.frame.size.width*sender.currentPage, 0, self.view.frame.size.width, self.scrollView.frame.size.height) animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    
    NSArray<NSString *>* arrayOfImages = @[@"Lighthouse-in-Field", @"Lighthouse-night", @"Lighthouse", @"home-lighthouse", @"Wawatan_Lighthouse_2010"];
    
    self.pageControl.numberOfPages = arrayOfImages.count;
    [self.pageControl addTarget:self action:@selector(pageClicked:) forControlEvents:UIControlEventValueChanged];
    
    NSMutableArray<UIImageView *>* arrayOfImageViews = [NSMutableArray array];
    for(int i = 0; i < arrayOfImages.count; i++) {
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        imageView.translatesAutoresizingMaskIntoConstraints = NO;
        imageView.image = [UIImage imageNamed:arrayOfImages[i]];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.userInteractionEnabled = YES;
        
        [self.scrollView addSubview:imageView];
        
        UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapped:)];
        [imageView addGestureRecognizer:tapGesture];
        
        [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0].active = YES;
        [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0].active = YES;
        [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0].active = YES;
        [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0].active = YES;
        [arrayOfImageViews addObject: imageView];
    }
    
    for(int i = 0; i < arrayOfImageViews.count; i++) {
        if(i==0) {
            [NSLayoutConstraint constraintWithItem:arrayOfImageViews[i] attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0].active = YES;
        } else {
            [NSLayoutConstraint constraintWithItem:arrayOfImageViews[i] attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:arrayOfImageViews[i-1] attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0].active = YES;
        }
        if(i==arrayOfImageViews.count-1) {
            [NSLayoutConstraint constraintWithItem:arrayOfImageViews[i] attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0].active = YES;
        }
    }
    
}

- (void) imageTapped:(UITapGestureRecognizer *)gesture {
    [self performSegueWithIdentifier:@"detailedViewSegue" sender:gesture.view];
}



@end
