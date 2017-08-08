//
//  twoViewController.m
//  MVVM&RAC
//
//  Created by 李军 on 2017/6/5.
//  Copyright © 2017年 李军. All rights reserved.
//

#import "twoViewController.h"

#import <objc/runtime.h>

@interface twoViewController ()

@end

@implementation twoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIButton *btn = [[UIButton alloc] initWithFrame:self.view.frame];
    [btn setBackgroundColor:[UIColor whiteColor]];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    NSArray  *array = [NSArray array];
    NSString *string = [array objectAtIndex:1];
    
}

+ (void)load {
    
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        
        SEL safeSel = @selector(sefeObjectAtIndex:);
        SEL unsafeSel = @selector(objectAtIndex:);
        
        Class myClass = NSClassFromString(@"__NSArrayI");
        Method safeMethod = class_getInstanceMethod(myClass, safeSel);
        Method unsafeMethod = class_getInstanceMethod(myClass, unsafeSel);
        
        method_exchangeImplementations(safeMethod, unsafeMethod);
    });
}
- (id)sefeObjectAtIndex:(NSUInteger *)index {
    
    if (YES) {
        
        NSAssert(NO,@"beyond the boundary");
        
        return nil;
    }else {
        
        return [self sefeObjectAtIndex:index];
    }
}

id dynamicMethodIMP(id self, SEL _cmd, NSString *str)
{

    return @"1";
}

+ (BOOL)resolveInstanceMethod:(SEL)sel __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_2_0) {
    
    
    class_addMethod(self.class,sel,(IMP)dynamicMethodIMP,"@@:");
    
    return YES;
}

- (void)click {
    
    if (self.subjec) {
        
        [self.subjec sendNext:@1];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
