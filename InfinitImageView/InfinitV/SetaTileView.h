//
//  SetaTileView.h
//  VRecommend
//
//  Created by cheamseta on 3/15/14.
//  Copyright (c) 2014 cheamseta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetaTileView : UIView
{

}

- (id)initWithFrame:(CGRect)frame withArray:(NSArray *)array;

- (UIImage *)tileAtPosition:(int)position;

- (NSDictionary *)collectionFromTouch:(CGPoint)touchPoint;

@end

@interface setaTileLayer : CATiledLayer

@end
