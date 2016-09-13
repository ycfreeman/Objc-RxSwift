//
//  TestRepo.swift
//  test
//
//  Created by Freeman on 13/9/16.
//  Copyright © 2016 Freeman. All rights reserved.
//

import Foundation
import RxSwift

// the repository is entirely in swift, no trouble here
class TestRepo {
    
    let disposeBag = DisposeBag()
    
    // some shared state
    private var hotObservable: Variable<Int>
    
    private init() {
        hotObservable = Variable(1)
        let timer: Observable<Int> = Observable.interval(1, scheduler: MainScheduler.instance)
        
        // always hot
        timer.subscribeNext {
            [unowned self]
            (newTime) in
            self.hotObservable.value = newTime
        }.addDisposableTo(disposeBag)
        
        _ = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
            .subscribe(onNext: { _ in
                print("Resource count \(RxSwift.resourceCount)")
            })
    }
    
    static let sharedInstance = TestRepo()
    
    // stateless cold observable
    func intColdObservable() -> Observable<Int> {
        return Observable.interval(1, scheduler: MainScheduler.instance)
    }
    
    // stateful hot observable
    func intHotObservable() -> Observable<Int> {
        return hotObservable.asObservable()
    }
}