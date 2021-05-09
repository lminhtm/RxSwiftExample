import UIKit
import RxSwift

// Simplify Observer
class Example3 {
    
    // Observable
    var observable: Observable<String>
    
    // Dispose Bag
    let disposeBag = DisposeBag()
    
    init() {
        // Init Observable
        observable = Observable.of("Red", "Blue")
    }
    
    func doExample() {
        // Observer subcribe Observable (no observer visible here)
        observable.subscribe { (event) in
            print(event)
        }.disposed(by: disposeBag)
    }
}
Example3().doExample()
