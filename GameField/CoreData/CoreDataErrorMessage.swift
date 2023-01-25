//
//  CoreDataErrorMessage.swift
//  GameField
//
//  Created by Ali serkan Boyracı  on 20.01.2023.
//

import Foundation

enum CoreDataCustomError {
    case saveError
    case loadError
    case updateError
    case deleteError
}

extension CoreDataCustomError: Error {
    var message: String {
        switch self {
        case .loadError:
            return "Failed to Load"
        case .saveError:
            return "Failed to Save"
        case .updateError:
            return "Failed to Update"
        case .deleteError:
            return "Failed to Delete"
        }
    }
}
