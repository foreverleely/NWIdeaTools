//
//  UIView+NWRound.m
//  NWIdeaToolsDemo
//
//  Created by liyangly on 2019/8/12.
//  Copyright © 2019 liyang. All rights reserved.
//

#import "UIView+NWRound.h"

@implementation UIView (NWRound)


/**
 add Rounded Corners

 @param corners UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 @param radii corner size
 @param rect the view rect
 */
- (void)nw_addRoundedCorners:(UIRectCorner)corners radii:(CGSize)radii viewRect:(CGRect)rect {
    
    UIBezierPath *rounded = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
    CAShapeLayer *shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    
    self.layer.mask = shape;
}

@end
