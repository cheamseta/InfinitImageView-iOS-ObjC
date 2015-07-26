//
//  InfinitViewController.m
//  InfinitImageView
//
//  Created by cheamseta on 3/15/14.
//  Copyright (c) 2014 cheamseta. All rights reserved.
//

#import "InfinitViewController.h"
#import "SetaTileView.h"
//#import "UIView+animation.h"
//#import "DetailViewController.h"

#define BIG 3010349

@interface InfinitViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView * infinitScrollView;
@end

@implementation InfinitViewController
@synthesize recommendCollections;

- (void)viewDidLoad
{
  [super viewDidLoad];

  self.infinitScrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
  [self.infinitScrollView setContentSize:CGSizeMake(BIG, BIG)];
  [self.infinitScrollView setDelegate:self];
  [self.infinitScrollView setContentOffset:CGPointMake(BIG/2, BIG/2) animated:YES];
  [self.infinitScrollView setBackgroundColor:[UIColor whiteColor]];
  [self.infinitScrollView setShowsHorizontalScrollIndicator:NO];
  [self.infinitScrollView setShowsVerticalScrollIndicator:NO];
  [self.infinitScrollView setDecelerationRate:UIScrollViewDecelerationRateFast];

  [self.view addSubview:self.infinitScrollView];
  
//
//  CGRect inifinitFrame = CGRectMake(0, 0, BIG, BIG);
//  SetaTileView *tiles = [[SetaTileView alloc] initWithFrame:inifinitFrame withArray:recommendCollections];
//  [self.infinitScrollView addSubview:tiles];
//  
//  UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
//                                 initWithTarget:self
//                                 action:@selector(tapDetected:)];
//  
//  [tiles addGestureRecognizer:tap];
}

- (void)tapDetected:(UITapGestureRecognizer *)tap {
  
  SetaTileView *tiles = (SetaTileView *)tap.view;
  
  CGPoint tapPoint = [tap locationInView:tiles];
  //NSDictionary *VrecomDic = [tiles collectionFromTouch:tapPoint];
  
//  DetailViewController *detailVC = [[DetailViewController alloc] init];
//  [detailVC setRecommendId:VrecomDic[@"_id"]];
//  [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
