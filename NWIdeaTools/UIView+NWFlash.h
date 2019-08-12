//
//  UIView+NWFlash.h
//  NWIdeaToolsDemo
//
//  Created by liyangly on 2019/8/12.
//  Copyright © 2019 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (NWFlash)

- (void)nw_addFlash:(CGSize)size
              color:(UIColor *)color
            isSmall:(BOOL)isSmall
            isShake:(BOOL)shake;

- (void)nw_removeFlash;

@end

NS_ASSUME_NONNULL_END
