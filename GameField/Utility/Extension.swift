//
//  Extension.swift
//  GameField
//
//  Created by Ali serkan Boyracı  on 19.01.2023.
//

import Foundation

extension Int {
    func toString() -> String {
        String(describing: self)
    }
}

extension Double {
    func toString() -> String {
        String(describing: self)
    }
}

extension Optional where Wrapped == String {
    var isNilOrEmpty: Bool {
        self == nil || self == ""
    }
}
