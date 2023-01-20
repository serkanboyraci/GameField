//
//  QueryItem.swift
//  GameField
//
//  Created by Ali serkan Boyracı  on 20.01.2023.
//

import Foundation

enum QueryItem {
    case ordering(String)
}

extension QueryItem {
    var urlQueryItem: URLQueryItem {
        switch self {
        case .ordering(let value):
            return URLQueryItem(name: "ordering", value: value)
        }
    }
}
