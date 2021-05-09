//
//  Example6.swift
//  Observables
//
//  Created by LMinh on 08/05/2021.
//  Copyright © 2021 LMinh. All rights reserved.
//

import Foundation
import RxSwift

class Example {
    
    // Observable
    var observable: Observable<String>
    
    // Dispose Bag
    let disposeBag = DisposeBag()
    
    init() {
        // Init Observable
        observable = Observable.of("Red", "Blue")
    }
    
    func doExample() {
        // Observer subcribe Observable
        observable.subscribe { (event) in
            print(event)
        }.disposed(by: disposeBag)
    }
}
