//
//  InfinitScrollView.h
//  infinitImageView
//
//  Created by seta cheam on 26/7/2015.
//  Copyright (c) 2015 seta cheam. All rights reserved.
//
//  This library is dedicated for "អូនស្អាតរបស់បង"

#import <UIKit/UIKit.h>

@protocol InfinitScrollViewDelegate;

@interface InfinitScrollView : UIScrollView
@property (nonatomic,weak) id<InfinitScrollViewDelegate> infinitDelegate;
- (id)initWithFrame:(CGRect)frame withArray:(NSArray *)array;
@end

@protocol InfinitScrollViewDelegate <NSObject>
- (void)InfinitScrollView:(InfinitScrollView *)scrollView didTapOnImage:(UIImage *)image;
@end
