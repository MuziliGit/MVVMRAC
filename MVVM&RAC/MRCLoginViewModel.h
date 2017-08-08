//
//  MRCLoginViewModel.h
//  MVVM&RAC
//
//  Created by 李军 on 2017/6/21.
//  Copyright © 2017年 李军. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MRCLoginViewModel : NSObject

@property (nonatomic, strong)NSString   *mobileNum;//!<

@property (nonatomic, strong)NSString   *smsCode;//!<

@property (nonatomic, strong)RACCommand   *loginCommand;//!< 

@end
