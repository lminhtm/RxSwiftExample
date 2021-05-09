//
//  SimpleViewModel.swift
//  MVVM
//
//  Created by LMinh on 08/05/2021.
//  Copyright © 2021 LMinh. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class SimpleViewModel {
    
    // MARK: - Properties
    
    /// Model reference here
    private var model: SimpleModel {
        didSet {
            updateBinding()
        }
    }
    
    /// This is what view need. Model shouldn't have reference to view
    var simpleNumberText: PublishSubject<String> = PublishSubject()
    
    // MARK: - Init
    
    init(model: SimpleModel) {
        self.model = model
        updateBinding()
    }
}

// MARK: - Business Logic

extension SimpleViewModel {
    
    func makeRandom() {
        model.makeRandom()
    }
    
    func updateBinding() {
        // Transform model if needed
        let numberText = String(describing: model.value)
        
        // Update binding
        simpleNumberText.onNext(numberText)
    }
}
