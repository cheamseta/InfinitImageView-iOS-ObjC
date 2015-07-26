//
//  InfinitScrollView.m
//  infinitImageView
//
//  Created by seta cheam on 26/7/2015.
//  Copyright (c) 2015 seta cheam. All rights reserved.
//
//  This library is dedicated for "អូនស្អាតរបស់បង"

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
    SetaTileView *tiles = [[SetaTileView alloc] initWithArray:array];
    [tiles setFrame:inifinitFrame];
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
  UIImage *image = [tiles imageFromPostion:tapPoint];
  
  if ([self.infinitDelegate respondsToSelector:@selector(InfinitScrollView:didTapOnImage:)]){
    [self.infinitDelegate InfinitScrollView:self didTapOnImage:image];
  }
  
}

@end
