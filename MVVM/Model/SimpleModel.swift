//
//  SimpleModel.swift
//  MVVM
//
//  Created by LMinh on 08/05/2021.
//  Copyright © 2021 LMinh. All rights reserved.
//

import Foundation

struct SimpleModel {
    var value: Int = 0
}

extension SimpleModel {
    mutating func makeRandom() {
        value = Int.random(in: 0..<100)
    }
}
