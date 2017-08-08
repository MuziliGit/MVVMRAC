//
//  ViewController.h
//  MVVM&RAC
//
//  Created by 李军 on 2017/6/1.
//  Copyright © 2017年 李军. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

extern NSString *const kName;

@property (nonatomic, strong)NSObject   *foo;//!<

@property (nonatomic, strong)NSObject   *_foo;//!<

@end

