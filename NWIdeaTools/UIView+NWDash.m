//
//  UIView+NWDash.m
//  NWIdeaToolsDemo
//
//  Created by liyangly on 2019/8/12.
//  Copyright © 2019 liyang. All rights reserved.
//

#import "UIView+NWDash.h"

@implementation UIView (NWDash)

- (void)drawDashLineLength:(int)lineLength
               lineSpacing:(int)lineSpacing
                 lineColor:(UIColor *)lineColor
                directType:(NWDashDirectionType)directionType
{
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:self.bounds];
    switch (directionType) {
        case NWDashDirectionTypeRow:
            [shapeLayer setPosition:CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame))];
            break;
        case NWDashDirectionTypeColumn:
            [shapeLayer setPosition:CGPointMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) / 2)];
            break;
        default:
            break;
    }
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    
    //  设置虚线颜色为
    [shapeLayer setStrokeColor:lineColor.CGColor];
    
    //  设置虚线宽度
    switch (directionType) {
        case NWDashDirectionTypeRow:
            [shapeLayer setLineWidth:CGRectGetHeight(self.frame)];
            break;
        case NWDashDirectionTypeColumn:
            [shapeLayer setLineWidth:CGRectGetWidth(self.frame)];
            break;
        default:
            break;
    }
    [shapeLayer setLineJoin:kCALineJoinRound];
    
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    switch (directionType) {
        case NWDashDirectionTypeRow:
            CGPathAddLineToPoint(path, NULL, CGRectGetWidth(self.frame), 0);
            break;
        case NWDashDirectionTypeColumn:
            CGPathAddLineToPoint(path, NULL, 0, CGRectGetHeight(self.frame));
            break;
        default:
            break;
    }
    [shapeLayer setPath:path];
    CGPathRelease(path);
    
    //  把绘制好的虚线添加上来
    [self.layer addSublayer:shapeLayer];
}

- (void)drawDashWithPosType:(NWDashPositionType)positionType
                 lineLength:(int)lineLength
                lineSpacing:(int)lineSpacing
                  lineColor:(UIColor *)lineColor
{
    
    if (self.frame.size.width == 1) {
        [self drawDashLineLength:lineLength lineSpacing:lineSpacing lineColor:lineColor directType:NWDashDirectionTypeColumn];
    } else if (self.frame.size.height == 1) {
        [self drawDashLineLength:lineLength lineSpacing:lineSpacing lineColor:lineColor directType:NWDashDirectionTypeRow];
    } else {
        
        switch (positionType) {
            case NWDashPositionTypeLeftTop:
            {
                UIView *leftView = [UIView new];
                leftView.frame = CGRectMake(0, 0, 1, CGRectGetHeight(self.frame));
                [self addSubview:leftView];
                [leftView drawDashLineLength:lineLength lineSpacing:lineSpacing lineColor:lineColor directType:NWDashDirectionTypeColumn];
                
                UIView *topView = [UIView new];
                topView.frame = CGRectMake(1, 0, CGRectGetWidth(self.frame) - 1, 1);
                [self addSubview:topView];
                [topView drawDashLineLength:lineLength lineSpacing:lineSpacing lineColor:lineColor directType:NWDashDirectionTypeRow];
            }
                break;
            case NWDashPositionTypeRightTop:
            {
                UIView *rightView = [UIView new];
                rightView.frame = CGRectMake(CGRectGetWidth(self.frame) - 1, 0, 1, CGRectGetHeight(self.frame));
                [self addSubview:rightView];
                [rightView drawDashLineLength:lineLength lineSpacing:lineSpacing lineColor:lineColor directType:NWDashDirectionTypeColumn];
                
                UIView *topView = [UIView new];
                topView.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame) - 1, 1);
                [self addSubview:topView];
                [topView drawDashLineLength:lineLength lineSpacing:lineSpacing lineColor:lineColor directType:NWDashDirectionTypeRow];
            }
                break;
            case NWDashPositionTypeLeftBottom:
            {
                UIView *leftView = [UIView new];
                leftView.frame = CGRectMake(0, 0, 1, CGRectGetHeight(self.frame));
                [self addSubview:leftView];
                [leftView drawDashLineLength:lineLength lineSpacing:lineSpacing lineColor:lineColor directType:NWDashDirectionTypeColumn];
                
                UIView *bottomView = [UIView new];
                bottomView.frame = CGRectMake(1, CGRectGetHeight(self.frame) - 1, CGRectGetWidth(self.frame) - 1, 1);
                [self addSubview:bottomView];
                [bottomView drawDashLineLength:lineLength lineSpacing:lineSpacing lineColor:lineColor directType:NWDashDirectionTypeRow];
            }
                break;
            case NWDashPositionTypeRightBottom:
            {
                UIView *rightView = [UIView new];
                rightView.frame = CGRectMake(CGRectGetWidth(self.frame) - 1, 0, 1, CGRectGetHeight(self.frame));
                [self addSubview:rightView];
                [rightView drawDashLineLength:lineLength lineSpacing:lineSpacing lineColor:lineColor directType:NWDashDirectionTypeColumn];
                
                UIView *bottomView = [UIView new];
                bottomView.frame = CGRectMake(0, CGRectGetHeight(self.frame) - 1, CGRectGetWidth(self.frame) - 1, 1);
                [self addSubview:bottomView];
                [bottomView drawDashLineLength:lineLength lineSpacing:lineSpacing lineColor:lineColor directType:NWDashDirectionTypeRow];
            }
                break;
            default:
                break;
        }
    }
    
}

@end
