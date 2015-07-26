//
//  SetaTileView.m
//  VRecommend
//
//  Created by cheamseta on 3/15/14.
//  Copyright (c) 2014 cheamseta. All rights reserved.
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
  NSUInteger albums;
  BOOL isDone;
  int columns;
  int limit;
}

@property (strong, nonatomic) UIImageView *imageView;
@property (nonatomic, strong)  NSMutableArray *recommendCollections;

@end


@implementation SetaTileView
@synthesize recommendCollections;
+ (Class)layerClass {
  return [setaTileLayer class];
}

- (id)initWithFrame:(CGRect)frame withArray:(NSArray *)array
{
  if ((self = [super initWithFrame:frame])) {
    self.recommendCollections = [[NSMutableArray alloc] initWithArray:array];
    setaTileLayer *tiledLayer = (setaTileLayer *)[self layer];
    CGFloat sf = self.contentScaleFactor;
    tiledLayer.tileSize = CGSizeMake(SIZE*sf, SIZE*sf);
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
  albums = [self.recommendCollections count];
  int index = position%albums;
  
  UIImage * image = [self.recommendCollections objectAtIndex:index];
  return image;
}

- (NSDictionary *)collectionFromTouch:(CGPoint)touchPoint {
  int col = touchPoint.x / SIZE;
  int row = touchPoint.y / SIZE;
  int position = row*columns+col;
  int index = position%albums;
  
  NSDictionary *VremmDic = [self.recommendCollections objectAtIndex:index];
  return VremmDic;
}

@end
