import UIKit
import RxSwift

// Base Concept
class Example1 {
    
    // Observable - emits notifications of change.
    var observable: Observable<String>

    // Observer/Subscriber - subscribes to an Observable and gets notified when that Observable has changed.
    var observer1: Disposable?
    var observer2: Disposable?
    
    init() {
        // Init Observable
        observable = Observable<String>.just("Red")
    }
    
    deinit {
        // Release subscription
        observer1?.dispose()
        observer2?.dispose()
    }
    
    func doExample() {
        // Observer subcribe Observable
        observer1 = observable.subscribe { (event) in
            print(event)
        }
        
        // Observer subcribe Observable (full options)
        observer2 = observable.subscribe(onNext: { (value) in
            print(value)
        }, onError: { (error) in
            print(error.localizedDescription)
        }, onCompleted: {
            print("Completed")
        }, onDisposed: {
            print("Disposed")
        })
    }
}
Example1().doExample()
