//
//  ViewController.m
//  InfinitImageView
//
//  Created by seta cheam on 26/7/2015.
//  Copyright (c) 2015 seta cheam. All rights reserved.
//

#import "ViewController.h"
#import "InfinitScrollView.h"
#import "AFHTTPRequestOperationManager.h"

@interface ViewController ()<InfinitScrollViewDelegate>
@property (nonatomic, strong) InfinitScrollView * infinitScrollView;
@property (nonatomic, strong) UIView * subView;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  // example 1
  //[self loadInfinitLocalImage];
  
  // example 2
  [self loadInfinitRemoteImage];
}

- (void)loadInfinitLocalImage {
  
  NSArray * localImageArray = @[
                                [UIImage imageNamed:@"1.jpg"],
                                [UIImage imageNamed:@"2.jpg"],
                                [UIImage imageNamed:@"3.jpg"]
                                ];
  
  self.infinitScrollView = [[InfinitScrollView alloc] initWithFrame:self.view.frame withArray:localImageArray];
  [self.infinitScrollView setInfinitDelegate:self];
  [self.view addSubview:self.infinitScrollView];
  
}

- (void)loadInfinitRemoteImage {
  
  NSString *escapedDataString = [@"flower" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
  NSString *url = [NSString stringWithFormat:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=af3c98797a0d54d1302425d767e2a36a&text=%@&format=json&nojsoncallback=1", escapedDataString];
  
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSDictionary *dict = (NSDictionary *)responseObject;
    NSArray * flickArray = [[dict objectForKey:@"photos"] objectForKey:@"photo"];
    
    self.infinitScrollView = [[InfinitScrollView alloc] initWithFrame:self.view.frame withArray:flickArray];
    [self.infinitScrollView setInfinitDelegate:self];
    [self.view addSubview:self.infinitScrollView];
    
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"%@", error);
  }];

}


#pragma mark - infinit delegate

- (void)InfinitScrollView:(InfinitScrollView *)scrollView didTapOnImage:(UIImage *)image {

  UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width)];
  [imageView setImage:image];
  
  self.subView  = [[UIView alloc] initWithFrame:self.view.frame];
  [self.subView setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.7]];
  [self.subView addSubview:imageView];
  
  UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                 initWithTarget:self
                                 action:@selector(tapDetected:)];
  [self.subView addGestureRecognizer:tap];
  [self.view addSubview:self.subView];
}

- (void)tapDetected:(UITapGestureRecognizer *)tap {
  [self.subView removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
