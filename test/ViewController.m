//
//  ViewController.m
//  test
//
//  Created by Freeman on 13/9/16.
//  Copyright © 2016 Freeman. All rights reserved.
//

#import "ViewController.h"
#import "test-Swift.h"

@interface ViewController ()

@end

@implementation ViewController


// we have lots of UI populating methods like this
- (void) legacySelector: (NSString*) str {
    self.label2.text = str;
}

- (void)viewWillAppear:(BOOL)animated {
    __weak __typeof__(self) weakSelf = self;
    
    // of course we won't be able to use RxCocoa binders for Objc ViewControllers
    // but we can pass a oc block into a swift extension
    
    [self subscribeCold:^(NSString * _Nonnull str) {
        // set UI elements within block
        weakSelf.label.text = str;
    }];
    
    [self subscribeHot:^(NSString * _Nonnull str) {
        // call some old delegate/selector like thi
        [weakSelf legacySelector:str];
    }];
}

- (void)viewDidDisappear:(BOOL)animated {
    // trigger a self.dispose() to unsubscribe all rx subscriptions
    [self dispose];
}

// these subscribe/unsubscribe pair can be placed in
// viewWillAppear/willDidDisappear - dispose on disappear
// viewDidLoad/dealloc - dispose on view getting removed from view stack
// depends on use case

- (void)dealloc {
    NSLog(@"dealloc %@", self);
}

@end
