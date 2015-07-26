//
//  SetaTileView.m
//  InfiniteImageView
//
//  Created by cheamseta on 3/15/14.
//  Copyright (c) 2014 cheamseta. All rights reserved.
//
//  This library is dedicated for "អូនស្អាតរបស់បង"
//
//

#import "SetaTileView.h"

#define SIZE 100

@implementation setaTileLayer

+ (CFTimeInterval)fadeDuration {
  return 0.2;
}

@end

@interface SetaTileView()
{
  NSUInteger imageCounter;
  BOOL isDone;
  int columns;
  int limit;
}

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong)  NSArray *imageArray;

@end


@implementation SetaTileView
@synthesize imageArray;

+ (Class)layerClass {
  return [setaTileLayer class];
}

- (id)initWithArray:(NSArray *)array
{
  if ((self = [super init])) {
    self.imageArray = array;
    setaTileLayer *tiledLayer = (setaTileLayer *)[self layer];
    CGFloat sf = self.contentScaleFactor;
    tiledLayer.tileSize = CGSizeMake(SIZE * sf, SIZE * sf);
    isDone = YES;
  }
  return self;
}

- (void)drawRect:(CGRect)rect {
  
  int col = rect.origin.x / SIZE;
  int row = rect.origin.y / SIZE;
  columns = self.bounds.size.width/SIZE;
  UIImage *tile = [self tileAtPosition:row * columns + col];
  [tile drawInRect:rect];
}

- (UIImage *)tileAtPosition:(int)position
{
  imageCounter = [self.imageArray count];
  int index = position % imageCounter;
  
  UIImage * image = nil;
  if ([[self.imageArray objectAtIndex:index] isKindOfClass:[UIImage class]]){
    image = [self.imageArray objectAtIndex:index];
  }else{
    NSDictionary *imageDict = [self.imageArray objectAtIndex:index];
    // appended string to create flick image path url
    NSString * flickImageUrl = [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@.jpg",
                                imageDict[@"farm"],
                                imageDict[@"server"],
                                imageDict[@"id"],
                                imageDict[@"secret"]];
    
    image =  [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:flickImageUrl]]];
  }
  
  return image;
}

- (UIImage *)imageFromPostion:(CGPoint)touchPoint {
  int col = touchPoint.x / SIZE;
  int row = touchPoint.y / SIZE;
  int position = row * columns + col;
  int index = position % imageCounter;
  
  UIImage *image = nil;
  
  if ([[self.imageArray objectAtIndex:index] isKindOfClass:[UIImage class]]){
    image = [self.imageArray objectAtIndex:index];
  }else{
    NSDictionary *imageDict = [self.imageArray objectAtIndex:index];
    // appended string to create flick image path url
    NSString * flickImageUrl = [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@.jpg",
                                imageDict[@"farm"],
                                imageDict[@"server"],
                                imageDict[@"id"],
                                imageDict[@"secret"]];
    
    image =  [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:flickImageUrl]]];
  }
  return image;
}

@end
