//
//  Person.m
//  MVVM&RAC
//
//  Created by 李军 on 2017/6/16.
//  Copyright © 2017年 李军. All rights reserved.
//

#import "Person.h"

@implementation Person
- (NSString *)description {
    
    return [NSString stringWithFormat:@"name:%@ hobbies%@",self.name,self.hobbies];
}
@end
