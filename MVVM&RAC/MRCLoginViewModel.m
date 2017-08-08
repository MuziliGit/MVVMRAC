//
//  MRCLoginViewModel.m
//  MVVM&RAC
//
//  Created by 李军 on 2017/6/21.
//  Copyright © 2017年 李军. All rights reserved.
//

#import "MRCLoginViewModel.h"

@implementation MRCLoginViewModel

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.mobileNum = @"";
        
        self.smsCode = @"";
        
        RACSignal * mobileNumSignal = [RACObserve(self, mobileNum) filter:^BOOL(NSString * value) {
            
            return value.length == 11;
        }];
        
        RACSignal *smsCodeSignal = [RACObserve(self, smsCode) filter:^BOOL(NSString * value) {
           
            return value.length == 4;
        }];
        
        @weakify(self);
        [[RACSignal combineLatest:@[mobileNumSignal,smsCodeSignal]] subscribeNext:^(id x) {
           
            @strongify(self);
            
            [self.loginCommand execute:nil];
        }];
    }
    return self;
}

- (RACCommand *)loginCommand {
    
    if (nil == _loginCommand) {
        
        @weakify(self);
//        _loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
//           
//            
//        }];
    }
    
    return _loginCommand;
}

@end
