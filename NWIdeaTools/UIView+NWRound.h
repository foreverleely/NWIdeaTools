//
//  UIView+NWRound.h
//  NWIdeaToolsDemo
//
//  Created by liyangly on 2019/8/12.
//  Copyright © 2019 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (NWRound)

/**
 add Rounded Corners
 
 @param corners UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 @param radii corner size
 @param rect the view rect
 */
- (void)nw_addRoundedCorners:(UIRectCorner)corners radii:(CGSize)radii viewRect:(CGRect)rect;

@end

NS_ASSUME_NONNULL_END
