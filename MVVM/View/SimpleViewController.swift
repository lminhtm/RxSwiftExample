//
//  SimpleViewController.swift
//  MVVM
//
//  Created by LMinh on 08/05/2021.
//  Copyright © 2021 LMinh. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SimpleViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var numberLabel: UILabel!
    
    /// View Model (can be here or somewhere else)
    lazy var viewModel: SimpleViewModel = {
        let model = SimpleModel()
        return SimpleViewModel(model: model)
    }()
    
    /// Dispose Bag
    let bag = DisposeBag()
    
    // MARK: - View Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Binding UI here
        bindUI()
    }
}

// MARK: - UI Stuff

extension SimpleViewController {
    func bindUI() {
        viewModel.simpleNumberText
            .bind(to: self.numberLabel.rx.text)
            .disposed(by: bag)
    }
}

// MARK: - Events

extension SimpleViewController {
    @IBAction func randomButtonTapped(_ sender: Any) {
        viewModel.makeRandom()
    }
}

