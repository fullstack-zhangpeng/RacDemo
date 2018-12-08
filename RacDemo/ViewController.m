//
//  ViewController.m
//  RacDemo
//
//  Created by zhangpeng on 2018/12/3.
//  Copyright © 2018 zhangpeng. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "ViewModel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *accountTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;

@property (weak, nonatomic) IBOutlet UIButton *button;

@property (weak, nonatomic) IBOutlet UILabel *accountLabel;
@property (weak, nonatomic) IBOutlet UILabel *passwordLabel;

@property (nonatomic, copy) NSString *account;
@property (nonatomic, copy) NSString *password;

@property (nonatomic, copy) NSString *testChannel;

@property (nonatomic, strong) ViewModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _viewModel = [[ViewModel alloc] init];
    
    // test RACObserve
    // 监听
    self.accountLabel.text = @"我要改变 accountLabel 的值";
    [RACObserve(self, accountLabel.text) subscribeNext:^(id x) {
        NSLog(@"1 - x: %@", x);
        NSLog(@"\nself.accountLabel 的值被改变了，\n改变后的值为：%@", x);
    }];
    
    // test Rac
    // 绑定
    //        RAC(self, accountLabel.text) = self.accountTF.rac_textSignal;
    //        RAC(self, passwordLabel.text) = self.passwordTF.rac_textSignal;
    
    // test Rac
    //     为什么 accountLabel 的文字没有了，但是 passwordLabel 的文字还在？
    //        RAC(self, accountLabel.text) = self.accountTF.rac_textSignal;
    //        RAC(self, passwordLabel.text) = [self.passwordTF.rac_textSignal skip:1];
    //        [RACObserve(self, accountLabel.text) subscribeNext:^(id x) {
    //            //        NSLog(@"1 - x: %@", x);
    //            NSLog(@"\nself.accountLabel 的值被改变了，\n改变后的值为：%@", x);
    //        }];
    
    // test RACChannelTo
    // 双向绑定
    //        RACChannelTo(self, testChannel) = RACChannelTo(self, viewModel.testChannel);
    //        NSLog(@"1 - self.testChannel: %@", self.testChannel);
    //        NSLog(@"1 - self.viewModel.testChannel: %@", self.viewModel.testChannel);
    //        self.testChannel = @"self 改变 testChannel";
    //        NSLog(@"2 - self.testChannel: %@", self.testChannel);
    //        NSLog(@"2 - self.viewModel.testChannel: %@", self.viewModel.testChannel);
    //        self.viewModel.testChannel = @"self.viewModel 改变 testChannel";
    //        NSLog(@"3 - self.testChannel: %@", self.testChannel);
    //        NSLog(@"3 - self.viewModel.testChannel: %@", self.viewModel.testChannel);
    
    // test Signal
    // 按钮事件
    //        [self.button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    //        [[self.button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
    //            NSLog(@"利用 rac 完成点击事件");
    //        }];
    
    // 监听事件完成
    //    [[self rac_signalForSelector:@selector(buttonClick:)] subscribeNext:^(id x) {
    //        NSLog(@"----");
    //    }];
    
    // 信号组合
//    @weakify(self);
//    [[[self.accountTF.rac_textSignal filter:^BOOL(id value) {
//        if ([value isKindOfClass:[NSString class]]) {
//            NSString *account = (NSString *)value;
//            return ([account hasPrefix:@"1"] ? YES : NO);
//        }
//        return NO;
//    }] map:^id(id value) {
//        return [NSString stringWithFormat:@"经过map操作: %@", value];
//    }] subscribeNext:^(id x) {
//        @strongify(self);
//        if ([x isKindOfClass:[NSString class]]) {
//            self.account = (NSString *)x;
//            //            NSLog(@"self.account: %@", self.account);
//        }
//    }];
    
    // 热信号 RACSubject
    //        RACBehaviorSubject *subject = [RACSubject subject];
    //        // Subscriber 1
    //    [subject sendNext:@1];
    //
    //        [subject subscribeNext:^(id  _Nullable x) {
    //            NSLog(@"1st Sub: %@", x);
    //        }];
    //        [subject sendNext:@1];
    //        // Subscriber 2
    //        [subject subscribeNext:^(id  _Nullable x) {
    //            NSLog(@"2nd Sub: %@", x);
    //        }];
    //        [subject sendNext:@2];
    //        // Subscriber 3
    //        [subject subscribeNext:^(id  _Nullable x) {
    //            NSLog(@"3rd Sub: %@", x);
    //        }];
    //        [subject sendNext:@3];
    //        [subject sendCompleted];
    
    // 热信号 RACBehaviorSubject
    //        RACBehaviorSubject *subject = [RACBehaviorSubject behaviorSubjectWithDefaultValue:@0];
    //        RACBehaviorSubject *subject = [RACBehaviorSubject behaviorSubjectWithDefaultValue:@0];
    //    [subject sendNext:@5];
    //    [subject sendNext:@6];
    //    [subject sendNext:@7];
    //        [subject subscribeNext:^(id  _Nullable x) {
    //            NSLog(@"1st Sub: %@", x);
    //        }];
    //        [subject sendNext:@1];
    //        [subject subscribeNext:^(id  _Nullable x) {
    //            NSLog(@"2nd Sub: %@", x);
    //        }];
    //        [subject sendNext:@2];
    //        [subject subscribeNext:^(id  _Nullable x) {
    //            NSLog(@"3rd Sub: %@", x);
    //        }];
    //        [subject sendNext:@3];
    //        [subject sendCompleted];
    
    //    // 热信号 RACReplaySubject
    //    RACReplaySubject *subject = [RACReplaySubject subject];
    //    [subject sendNext:@5];
    //    [subject sendNext:@6];
    //    [subject sendNext:@7];
    //    [subject subscribeNext:^(id  _Nullable x) {
    //        NSLog(@"1st Subscriber: %@", x);
    //    }];
    //    [subject sendNext:@1];
    //    [subject subscribeNext:^(id  _Nullable x) {
    //        NSLog(@"2nd Subscriber: %@", x);
    //    }];
    //    [subject sendNext:@2];
    //    [subject subscribeNext:^(id  _Nullable x) {
    //        NSLog(@"3rd Subscriber: %@", x);
    //    }];
    //    [subject sendNext:@3];
    //    [subject subscribeNext:^(id  _Nullable x) {
    //        NSLog(@"4th Subscriber: %@", x);
    //    }];
    //    [subject sendCompleted];
    
    // 冷信号 RACSignal
    // 订阅一次，执行一次代码块中的代码
    //    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    //        [subscriber sendNext:@1];
    //        [subscriber sendNext:@2];
    //        [subscriber sendNext:@3];
    //        [subscriber sendCompleted];
    //        return nil;
    //    }];
    //    NSLog(@"Signal was created.");
    //    [[RACScheduler mainThreadScheduler] afterDelay:0.1 schedule:^{
    //        [signal subscribeNext:^(id x) {
    //            NSLog(@"Subscriber 1 recveive: %@", x);
    //        }];
    //    }];
    //
    //    [[RACScheduler mainThreadScheduler] afterDelay:1 schedule:^{
    //        [signal subscribeNext:^(id x) {
    //            NSLog(@"Subscriber 2 recveive: %@", x);
    //        }];
    //    }];
}

- (void)buttonClick:(UIButton *)button {
    NSLog(@"buttonClick");
}

@end
