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


// here we can extend our OC ViewController classes to subscribe to observables
extension ViewController {
    
    // subscribe to observable value like this
    @objc func subscribeCold(onNext: (String) -> Void) {
        repo.intColdObservable()
            .map({ (value) -> String in
                return "\(value)"
            }).subscribeNext(onNext).addDisposableTo(disposeBag)
    }
    
    @objc func subscribeHot(onNext: (String) -> Void) {
        repo.intHotObservable()
            .map({ (value) -> String in
                return "\(value)"
            }).subscribeNext(onNext).addDisposableTo(disposeBag)
    }
}

extension ViewController2 {
    @objc func subscribeHot(onNext: (String) -> Void) {
        repo.intHotObservable()
            .map({ (value) -> String in
                return "\(value)"
            }).subscribeNext(onNext).addDisposableTo(disposeBag)
    }
}
