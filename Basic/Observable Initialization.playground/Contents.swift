import UIKit
import RxSwift

// Observable Initialization
class Example4 {
    
    // Observable
    var observable: Observable<String>
    var emptyObservable: Observable<Void>
    var neverObservable: Observable<Any>
    var rangeObservable: Observable<Int>
    
    // Dispose Bag
    let disposeBag = DisposeBag()
    
    init() {
        // Init Observable (only one item) - the easiest way to wrap a value
        // Phát ra phần tử duy nhất và kết thúc
        observable = Observable<String>.just("Red")
        
        // Init Observable (many items)
        // Phát ra lần lượt các phần tử cung cấp và kết thúc
        observable = Observable.of("Red", "Blue")
        
        // Init Observable (from array)
        // Tương tự như of mà tham số truyền vào là 1 array
        let items = ["Red", "Blue"]
        observable = Observable.from(items)
        
        // Init Empty Observable (only complete)
        // Không có gì hết và kết thúc
        emptyObservable = Observable<Void>.empty()
        
        // Init Never Observable (no things happen)
        // Không có gì luôn và không kết thúc luôn
        neverObservable = Observable<Any>.never()
        
        // Init Range Observable (like for in)
        // Tạo ra 1 vòng for, dùng cho Int và mỗi lần như vậy thì sẽ tăng giá trị lên
        rangeObservable = Observable<Int>.range(start: 0, count: 10)
    }
    
    func doExample() {
        // Observer subcribe Observable
        observable.subscribe { (event) in
            print(event)
        }.disposed(by: disposeBag)
        
        emptyObservable.subscribe { (event) in
            print(event)
        }.disposed(by: disposeBag)
        
        neverObservable.subscribe { (event) in
            print(event)
        }.disposed(by: disposeBag)
        
        rangeObservable.subscribe { (event) in
            print(event)
        }.disposed(by: disposeBag)
    }
}
Example4().doExample()
