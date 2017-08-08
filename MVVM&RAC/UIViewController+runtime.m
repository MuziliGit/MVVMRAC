//
//  UIViewController+runtime.m
//  MVVM&RAC
//
//  Created by 李军 on 2017/6/16.
//  Copyright © 2017年 李军. All rights reserved.
//

#import "UIViewController+runtime.h"
#import <objc/runtime.h>

typedef void (*_VIMP)(id,SEL,...);
typedef id(*_IMP)(id,SEL,...);
@implementation UIViewController (runtime)

+(void)load {
    
//    IMP msgForwardIMP = _objc_msgForward;
}

@end
