//
//  CoreDataSucceessMessage.swift
//  GameField
//
//  Created by Ali serkan Boyracı  on 20.01.2023.
//

import Foundation

enum CoreDataCustomSuccessMessage {
    case saveSuccess
    case updateSucces
    case deleteSucces
}

extension CoreDataCustomSuccessMessage {
    var message: String {
        switch self {
        case .saveSuccess:
            return "Successfully Added Favorites"
        case .updateSucces:
            return "Successfully edited"
        case .deleteSucces:
            return "Successfully Deleted From Favorites"
        }
    }
}
