//
//  NetworkServiceError.swift
//  GameField
//
//  Created by Ali serkan Boyracı  on 20.01.2023.
//

import Foundation

//MARK: - URLSessionDataTaskError
enum NetworkServiceError: Error {
    case noData
    case dataParseError
}

extension NetworkServiceError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .dataParseError:
            return "ParseError"
        case .noData:
            return "NoDataError"
           
        }
    }
}
