//
//  ViewController.m
//  InfinitImageView
//
//  Created by seta cheam on 26/7/2015.
//  Copyright (c) 2015 seta cheam. All rights reserved.
//

#import "ViewController.h"
#import "InfinitScrollView.h"

@interface ViewController ()
@property (nonatomic, strong) InfinitScrollView * infinitScrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self loadInfinitLocalImage];
}

- (void)loadInfinitLocalImage {
  
  NSArray * localImageArray = @[
                                [UIImage imageNamed:@"1.jpg"],
                                [UIImage imageNamed:@"2.jpg"],
                                [UIImage imageNamed:@"3.jpg"]
                                ];
  
  self.infinitScrollView = [[InfinitScrollView alloc] initWithFrame:self.view.frame withArray:localImageArray];
  [self.view addSubview:self.infinitScrollView];
  
}

- (void)loadInfinitRemoteImage {
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
