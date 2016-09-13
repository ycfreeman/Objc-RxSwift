//
//  ViewController+Extension.swift
//  test
//
//  Created by Freeman on 13/9/16.
//  Copyright © 2016 Freeman. All rights reserved.
//

import Foundation
import RxSwift

let repo = TestRepo.sharedInstance

extension ViewController {
    
    // subscribe to observable value like this
    @objc func subscribeCold(next: (String) -> Void) {
        repo.intColdObservable()
            .map({ (value) -> String in
                return "\(value)"
            }).subscribeNext(next).addDisposableTo(disposeBag)
    }
    
    @objc func subscribeHot(next: (String) -> Void) {
        repo.intHotObservable()
            .map({ (value) -> String in
                return "\(value)"
            }).subscribeNext(next).addDisposableTo(disposeBag)
    }
}

extension ViewController2 {
    @objc func subscribeHot(next: (String) -> Void) {
        repo.intHotObservable()
            .map({ (value) -> String in
                return "\(value)"
            }).subscribeNext(next).addDisposableTo(disposeBag)
    }
}
