//
//  NWMacroHeader.h
//  NWIdeaToolsDemo
//
//  Created by liyangly on 2019/8/12.
//  Copyright © 2019 liyang. All rights reserved.
//

#ifndef NWMacroHeader_h
#define NWMacroHeader_h

#define NWWIDTH(view) (view.frame.size.width)
#define NWHEIGHT(view) (view.frame.size.height)
#define NWLEFT(view) (view.frame.origin.x)
#define NWTOP(view) (view.frame.origin.y)
#define NWBOTTOM(view) (view.frame.origin.y + view.frame.size.height)
#define NWRIGHT(view) (view.frame.origin.x + view.frame.size.width)

#ifndef NW_DESIGN_WIDTH
#define NW_DESIGN_WIDTH (375)
#endif

#ifndef NW_DESIGN_HEIGHT
#define NW_DESIGN_HEIGHT (667)
#endif

#ifndef NW_SCREEN_WIDTH
#define NW_SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#endif

#ifndef NW_SCREEN_HEIGHT
#define NW_SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#endif

#ifndef NW_SX
#define NW_SX(x)  ((x) * NW_SCREEN_WIDTH / NW_DESIGN_WIDTH)
#endif

#ifndef NW_DEVICES_IS_PRO_12_9
#define NW_DEVICES_IS_PRO_12_9 ([UIScreen mainScreen].bounds.size.width == 1024)
#endif

#ifndef NW_SCALE_TO_PRO
#define NW_SCALE_TO_PRO (NW_DEVICES_IS_PRO_12_9? (1024.f/768.f): 1)
#endif

#ifndef NW_SNAP2
#define NW_SNAP2(s) ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? (s)*2*NW_SCALE_TO_PRO : NW_SX(s))
#endif

#ifndef NW_SNAP
#define NW_SNAP(s) ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? (s)*1.5*NW_SCALE_TO_PRO : NW_SX(s))
#endif


#ifndef nw_dispatch_queue_async_safe
#define nw_dispatch_queue_async_safe(queue, block)\
if (dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL) == dispatch_queue_get_label(queue)) {\
block();\
} else {\
dispatch_async(queue, block);\
}
#endif

#ifndef nw_dispatch_main_async_safe
#define nw_dispatch_main_async_safe(block) nw_dispatch_queue_async_safe(dispatch_get_main_queue(), block)
#endif


#endif /* NWMacroHeader_h */
