//
//  BaseViewController+Extension.swift
//  test
//
//  Created by Freeman on 13/9/16.
//  Copyright © 2016 Freeman. All rights reserved.
//

import Foundation
import RxSwift


// extend BaseViewController here
// self.bag is defined as id
// so we need to do a cast here
extension BaseViewController {
    // lazy init DisposeBag
    // we can't use swift lazy because this is an extension
    var disposeBag: DisposeBag {
        guard let disposeBag = self.bag as? DisposeBag else {
            self.bag = DisposeBag()
            return self.bag as! DisposeBag
        }
        return disposeBag
    }
    func dispose() {
        // dispose the bag
        self.bag = nil
    }
}
