//
//  InfinitScrollView.m
//  infinitImageView
//
//  Created by seta cheam on 26/7/2015.
//  Copyright (c) 2015 seta cheam. All rights reserved.
//

#import "InfinitScrollView.h"
#import "SetaTileView.h"

#define BIG 3010349

@implementation InfinitScrollView

- (id)initWithFrame:(CGRect)frame withArray:(NSArray *)array{
  self = [super initWithFrame:frame];
  
  if (self){
    
    [self setContentSize:CGSizeMake(BIG, BIG)];
    [self setContentOffset:CGPointMake(BIG/2, BIG/2) animated:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setShowsHorizontalScrollIndicator:NO];
    [self setShowsVerticalScrollIndicator:NO];
    [self setDecelerationRate:UIScrollViewDecelerationRateFast];
    
    CGRect inifinitFrame = CGRectMake(0, 0, BIG, BIG);
    SetaTileView *tiles = [[SetaTileView alloc] initWithFrame:inifinitFrame withArray:array];
    [self addSubview:tiles];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(tapDetected:)];
    
    [tiles addGestureRecognizer:tap];
    
  }
  
  return self;
}

- (void)tapDetected:(UITapGestureRecognizer *)tap {
  
  SetaTileView *tiles = (SetaTileView *)tap.view;
  
  CGPoint tapPoint = [tap locationInView:tiles];
  //NSDictionary *VrecomDic = [tiles collectionFromTouch:tapPoint];
  
  //  DetailViewController *detailVC = [[DetailViewController alloc] init];
  //  [detailVC setRecommendId:VrecomDic[@"_id"]];
  //  [self.navigationController pushViewController:detailVC animated:YES];
}

@end
