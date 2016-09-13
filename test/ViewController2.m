//
//  ViewController2.m
//  test
//
//  Created by Freeman on 13/9/16.
//  Copyright © 2016 Freeman. All rights reserved.
//

#import "ViewController2.h"
#import "test-Swift.h"

@implementation ViewController2

- (void)viewDidLoad {
    __weak __typeof__(self) weakSelf = self;

    [self subscribeHot:^(NSString * _Nonnull str) {
        weakSelf.label.text = str;
    }];
}

- (void)dealloc {
    [self dispose];
}

@end
