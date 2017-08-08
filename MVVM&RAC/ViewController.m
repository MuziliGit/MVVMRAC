//
//  ViewController.m
//  MVVM&RAC
//
//  Created by 李军 on 2017/6/1.
//  Copyright © 2017年 李军. All rights reserved.
//

#import "ViewController.h"
#import "twoViewController.h"
#import "Person.h"

#define Max(X, Y) ((X) > (Y) ? (X) : (Y))

@interface ViewController ()
{
    NSDate  *now;
}
@property (nonatomic, strong)UILabel *secondsLabel;

@property (nonatomic, strong)NSMutableArray *secondsarray;

@property (nonatomic, strong)UITextField  *mobileNumTF;

@property (nonatomic, strong)UITextField  *smsCodeTF;

@end

@implementation ViewController

NSString *const kName = @"测试";

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self one];

//    [self two];
    
//    [self three];
    
//    [self four];
    
//    [self five];
    
//    [self six];
    
//    [self seven];
    
//    [self nine];
    
//    [self ten];
    
//    [self eleve];
    
//    [self twele];
    
//    [self third];
    
//    NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:@(6), @(1),@(2),@(5),@(9),@(4),@(3),@(7),nil];
//    [self quickSortArray:arr withLeftIndex:0 andRightIndex:arr.count - 1];
//    
//    NSLog(@"%@",arr);
    
//    NSArray *array = @[@[@"a",@"b"],@[@"c",@"d"]];
//    NSArray *copyArray = [array copy];
//    NSMutableArray  *mCopyArray = [array mutableCopy];
//    NSLog(@"%p\n%p\n%p",array,copyArray,mCopyArray);
    
//    int array[5] = {1, 2, 3, 4, 5};
//    int *p = &array[0];
//    int max = Max(*p++, 1);
//    printf("%d %d", max, *p);
    
//    self.navigationController = [UINavigationController alloc] init
}

-(void)fourty {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"login_name" object:nil];
    
    [[[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"login_name" object:nil] takeUntil:[self rac_willDeallocSignal]] subscribeNext:^(id x) {
        
        NSNotification* notification = (NSNotification*)x;
        // 退出登录的时候接受到的通知
    }];
    
//    UITextField *textF = [[UITextField alloc] init];
//    [textF.rac_textSignal takeUntil:[self.rac_willDeallocSignal subscribeNext:^(id x) {
//       
//        
//    }]];
//    textF.rac_textSignal().take(until: self.rac_willDeallocSignal()).subscribeNext { [unowned self] (text) in
//        if let text = text as? String {
//            if text.length >= 1 { // 输入内容的长度判断
//                self.submitBtn.backgroundColor = UIColor.getMain()
//                self.submitBtn.setTitleColor(UIColor.white, for: .normal)
//                self.submitBtn.isUserInteractionEnabled = true
//            } else {
//                self.submitBtn.backgroundColor = UIColor.colorRGB16(value: 0xececec)
//                self.submitBtn.setTitleColor(UIColor.getContentSecond(), for: .normal)
//                self.submitBtn.isUserInteractionEnabled = false
//            }
//        }
//    }
}

-(void)third {
    
    [self addObserver:self forKeyPath:@"now" options:NSKeyValueObservingOptionNew context:nil];
    NSLog(@"1");
    [self willChangeValueForKey:@"now"]; // “手动触发self.now的KVO”，必写。
    NSLog(@"2");
    [self didChangeValueForKey:@"now"]; // “手动触发self.now的KVO”，必写。
    NSLog(@"4");
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    NSLog(@"3");
}

- (void)twele {
    
    NSLog(@"1");
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"2");
    });
    NSLog(@"3");
}

- (void)eleve {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"1"); // 任务1
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"2"); // 任务2
        });
        NSLog(@"3"); // 任务3
    });
    NSLog(@"4"); // 任务4
    while (1) {
    }
    NSLog(@"5"); // 任务5
}

- (void)ten {
    
    dispatch_queue_t queue = dispatch_queue_create("com.demo.serialQueue", DISPATCH_QUEUE_SERIAL);
    NSLog(@"1"); // 任务1
    dispatch_async(queue, ^{
        NSLog(@"2"); // 任务2
        dispatch_sync(queue, ^{
            NSLog(@"3"); // 任务3
        });
        NSLog(@"4"); // 任务4
    });
    NSLog(@"5"); // 任务5
}

- (void)nine {
    
    NSLog(@"1"); // 任务1
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"2"); // 任务2
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"3"); // 任务3
        });
        NSLog(@"4"); // 任务4
    });
    NSLog(@"5"); // 任务5
}

- (void)eight {
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        
        NSURL *url = [NSURL URLWithString:@""];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
           
            // 回到主线程
        });
    });
    
    dispatch_barrier_async(queue, ^{
       
        
    });
    
    dispatch_after(DISPATCH_TIME_NOW, queue, ^{
       
        
    });
}

- (void)seven {
    
    NSArray *array1 = @[@"1"];
    NSArray *array2 = [array1 copy];
    
    NSLog(@"1%p\n2%p",array1,array2);
}

- (void)six {
    
    NSString *str1 = @"abc";
    NSString *str2 = [NSString stringWithString:str1];
    NSString *str3 = [[NSString alloc] initWithString:str2];
    NSLog(@"%p\n%p\n%p",str1,str2,str3);
    
    NSString *str4 = [NSString stringWithFormat:@"abc"];
    NSString *str5 = [[NSString alloc] initWithFormat:@"abc"];
    
//    NSLog(@"4%p\n,5%p",str4,str5);
}

- (void)five {
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, queue, ^{ /*任务a */ });
    dispatch_group_async(group, queue, ^{ /*任务b */ });
    dispatch_group_async(group, queue, ^{ /*任务c */ });
    dispatch_group_async(group, queue, ^{ /*任务d */ });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        // 在a、b、c、d异步执行完成后，会回调这里
        
    });
    __weak typeof(self) weakSelf = self;
    
    self.secondsLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100,self.view.frame.size.width , 200)];
    self.secondsLabel.textAlignment = NSTextAlignmentCenter;
    self.secondsLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:self.secondsLabel];
    
    __block NSInteger i = 0;
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0f repeats:YES block:^(NSTimer * _Nonnull timer) {
        i++;
        weakSelf.secondsLabel.text = [NSString stringWithFormat:@"时间%ld",(long)i];
    }];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    NSTimer *time1 = [NSTimer scheduledTimerWithTimeInterval:1.0f repeats:YES block:^(NSTimer * _Nonnull timer) {
        
        
    }];
    
    [[NSRunLoop currentRunLoop] addTimer:time1 forMode:NSRunLoopCommonModes];
}

- (void)quickSortArray:(NSMutableArray *)array withLeftIndex:(NSInteger)leftIndex andRightIndex:(NSInteger)rightIndex {

    if (leftIndex >= rightIndex) {
        
        return;
    }
    
    NSInteger i = leftIndex;
    
    NSInteger j = rightIndex;
    
    NSInteger key = [array[i] integerValue];
    
    while (i < j) {
        
        while (i < j && [array[j] integerValue] >= key) {
            
            j--;
        }
        
        array[i] = array[j];
        
        while (i < j && [array[i] integerValue] <= key) {
            
            i++;
        }
        
        array[j] = array[i];
    }
    
    array[i] = @(key);
    
    /**** 递归排序 ***/
    //排序基准数左边的
    [self quickSortArray:array withLeftIndex:leftIndex andRightIndex:i - 1];
    //排序基准数右边的
    [self quickSortArray:array withLeftIndex:i + 1 andRightIndex:rightIndex];
    NSLog(@"1");
}

- (void)sortArray:(NSMutableArray *)array leftIndex:(NSInteger)left rightIndex:(NSInteger)right {
    
    if (left >= right) {
        
        return;
    }
    
    NSInteger i = left;
    
    NSInteger j = right;
    
    NSInteger key = [array[i] integerValue];
    
    while (i < j) {
        
        while (i < j && [array[j] integerValue] >= key) {
            
            j --;
        }
        
        array[i] = array[j];
        
        while (i < j && [array[i] integerValue] <= key) {
            
            i ++;
        }
        
        array[j] = array[i];
    }
}

- (void)four {
    
    RACSubject *letters = [RACSubject subject];
    RACSubject *numbers = [RACSubject subject];
    
    [[RACSignal
      combineLatest:@[letters, numbers]
      reduce:^(NSString *letter, NSString *number){
          return [letter stringByAppendingString:number];
      }]
     subscribeNext:^(NSString * x) {
         NSLog(@"%@", x);
     }];
    
    //B1 C1 C2
    [letters sendNext:@"A"];
    [letters sendNext:@"B"];
    [numbers sendNext:@"1"];
    [letters sendNext:@"C"];
    [numbers sendNext:@"2"];
}

- (void)three {
    
    RACSignal *signalA = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"signalA1"];
        [subscriber sendNext:@"signalA2"];
        return nil;
    }];
    RACSignal *signalB = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"signalB1"];
        [subscriber sendNext:@"signalB2"];
        return nil;
    }];
    // 把两个信号组合成一个信号
    RACSignal *combineSignal = [signalA combineLatestWith:signalB];
    [combineSignal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
}

- (void)two {
    
    RACSubject *google = [RACSubject subject];
    RACSubject *baidu = [RACSubject subject];
    RACSubject *signalOfSignal = [RACSubject subject];
    
    RACSignal *switchSignal = [signalOfSignal switchToLatest];
    
    [[switchSignal map:^id(id value) {
        
        return [@"https//www." stringByAppendingFormat:@"%@", value];
    }] subscribeNext:^(id x) {
        
        NSLog(@"%@", x);
    }];
    
    //通过开关打开baidu
    [signalOfSignal sendNext:baidu];
    [baidu sendNext:@"baidu.com"];
    [google sendNext:@"google.com"];
    
    //通过开关打开google
    [signalOfSignal sendNext:google];
    [baidu sendNext:@"baidu.com/"];
    [google sendNext:@"google.com/"];
}

- (void)one {
    
    NSLog(@"%@",kName);
    NSArray *array = @[@"you", @"are", @"beautiful"];
    
    RACSequence *sequence = [array rac_sequence];
    
    RACSignal *signale = sequence.signal;
    
    RACSignal *capitalizedSignal = [signale map:^id(id value) {
        
        return [value capitalizedString];
    }];
    
    [signale subscribeNext:^(id x) {
        
        NSLog(@"signal --- %@",x);
    }];
    
    [capitalizedSignal subscribeNext:^(id x) {
        
        NSLog(@"capitalizedSignal --- %@", x);
    }];
    
    RACSubject *subject = [RACSubject subject];
    [subject subscribeNext:^(id x) {
        
//        NSLog(@"1 %@,type:%@",x,NSStringFromClass([x class]));
    }];
    [subject subscribeNext:^(id x) {
        
//        NSLog(@"2 %@,type:%@",x,NSStringFromClass([x class]));
    }];
    
    [subject sendNext:@1];
    [subject subscribeNext:^(id x) {
        
        NSLog(@"3 %@,type:%@",x,NSStringFromClass([x class]));
    }];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    CATransform3D transform1 = CATransform3DMakeRotation(60*M_PI/180, 0, 0, 1);
    CGAffineTransform transform = CGAffineTransformMakeRotation(60*M_PI/180);
    btn.transform = transform;
}

- (void)click {
    
    twoViewController *vc = [[twoViewController alloc] init];
    vc.subjec = [RACSubject subject];
    [vc.subjec subscribeNext:^(id x) {
       
        NSLog(@"被通知了：%@",x);
    }];
    NSLog(@"self.navigationController %@",self.navigationController);
//    [self.navigationController pushViewController:vc animated:YES];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    Person *person = [[Person alloc] init];
    person.name = @"li";
    person.hobbies = @"jun";
    
    NSLog(@"%@",person);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
