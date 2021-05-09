import UIKit
import RxSwift

// Dispose Bag
class Example2 {
    
    // Observable
    var observable: Observable<String>

    // Observer
    var observer1: Disposable?
    var observer2: Disposable?
    
    // Dispose Bag
    let disposeBag = DisposeBag()
    
    init() {
        // Init Observable
        observable = Observable<String>.just("Red")
    }
    
    func doExample() {
        // Observer subcribe Observable
        observer1 = observable.subscribe { (event) in
            print(event)
        }
        observer2 = observable.subscribe { (event) in
            print(event)
        }
        
        // Add to Dispose Bag to release subscription later
        observer1?.disposed(by: disposeBag)
        observer2?.disposed(by: disposeBag)
    }
}
Example2().doExample()
