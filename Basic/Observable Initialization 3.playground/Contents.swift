import UIKit
import UIKit
import RxSwift

// Observable Initialization 3
class Example6 {
    
    // Dispose Bag
    let disposeBag = DisposeBag()
    
    // Deferred Observable - defer calculation until subscription
    // Trì hoãn việc phát dữ liệu khi có 1 subscription tới. Giúp cho bạn có thời gian để xử lý dữ liệu trước khi gởi đi
    func processImage(_ image: UIImage) -> Observable<UIImage> {
        return Observable<UIImage>.deferred({
            
            // Process image here
            
            // Then return later in closure
            return .just(image)
        })
    }
    
    func doExample() {
        let image = UIImage()
        processImage(image).subscribe { (processedImage) in
            print(processedImage)
        } onCompleted: {
            print("Completed")
        }.disposed(by: disposeBag)
    }
}
Example6().doExample()
