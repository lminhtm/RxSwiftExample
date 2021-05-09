import UIKit
import RxSwift

// Observable Initialization 2
class Example5 {
    
    // Create Observable - the most flexible way to create an Observable
    // Có thể xác định hành vi cho các việc next, error & completed trong closure của create.
    // Viết lại logic của 1 Non-Rx function thành Rx function.
    
    // Dispose Bag
    let disposeBag = DisposeBag()
    
    // Non-Rx function
    func someAsyncAction(completion: @escaping (Bool, Error?) -> Void) {
        DispatchQueue.global(qos: .utility).async {
            if Int.random(in: 0..<100) < 50 {
                completion(true, nil)
            }
            else {
                completion(false, NSError(domain: "", code: 0))
            }
        }
    }
    
    // Rx function
    func doAction() -> Observable<Bool> {
        return Observable.create { observer in
            // Do some async action
            self.someAsyncAction { (success, error) in
                if let error = error {
                    observer.onError(error)
                }
                else {
                    observer.onNext(true)
                    observer.onCompleted()
                }
            }
            return Disposables.create()
        }
    }
    
    func doExample() {
        doAction().subscribe { (success) in
            print(success)
        } onError: { (error) in
            print(error.localizedDescription)
        }.disposed(by: disposeBag)
    }
}
Example5().doExample()
