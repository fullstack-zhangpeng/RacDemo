//
//  ViewModel.h
//  RacDemo
//
//  Created by zhangpeng on 2018/12/6.
//  Copyright © 2018 zhangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewModel : NSObject
@property (nonatomic, copy) NSString *account;
@property (nonatomic, copy) NSString *password;

@property (nonatomic, copy) NSString *testChannel;
@end

NS_ASSUME_NONNULL_END
