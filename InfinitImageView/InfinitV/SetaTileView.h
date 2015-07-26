//
//  SetaTileView.h
//  InfiniteImageView
//
//  Created by cheamseta on 3/15/14.
//  Copyright (c) 2014 cheamseta. All rights reserved.
//  This library is dedicated for "អូនស្អាតរបស់បង"
//

#import <UIKit/UIKit.h>

@interface SetaTileView : UIView

/*
 
*/
- (id)initWithArray:(NSArray *)array;


/*
 
 */
- (UIImage *)imageFromPostion:(CGPoint)touchPoint;

@end

@interface setaTileLayer : CATiledLayer
@end
