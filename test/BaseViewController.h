//
//  BaseViewController.h
//  test
//
//  Created by Freeman on 13/9/16.
//  Copyright © 2016 Freeman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

// declare a id (AnyObject) property to hold our DisposeBag
@property (strong, nonatomic) id _Nullable bag;

@end
