//
//  UIView+NWDash.h
//  NWIdeaToolsDemo
//
//  Created by liyangly on 2019/8/12.
//  Copyright © 2019 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, NWDashDirectionType)
{
    NWDashDirectionTypeRow = 0,
    NWDashDirectionTypeColumn
};

typedef NS_ENUM(NSInteger, NWDashPositionType)
{
    NWDashPositionTypeLeftTop = 0,
    NWDashPositionTypeRightTop,
    NWDashPositionTypeLeftBottom,
    NWDashPositionTypeRightBottom
};

NS_ASSUME_NONNULL_BEGIN

@interface UIView (NWDash)

- (void)drawDashLineLength:(int)lineLength
               lineSpacing:(int)lineSpacing
                 lineColor:(UIColor *)lineColor
                directType:(NWDashDirectionType)directionType;

- (void)drawDashWithPosType:(NWDashPositionType)positionType
                 lineLength:(int)lineLength
                lineSpacing:(int)lineSpacing
                  lineColor:(UIColor *)lineColor;

@end

NS_ASSUME_NONNULL_END
