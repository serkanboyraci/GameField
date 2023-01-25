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
            return "Successfully Added"
        case .updateSucces:
            return "Successfully Edited"
        case .deleteSucces:
            return "Successfully Deleted"
        }
    }
}
