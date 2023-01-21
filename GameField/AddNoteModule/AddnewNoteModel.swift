//
//  AddnewNoteModel.swift
//  GameField
//
//  Created by Ali serkan Boyracı  on 21.01.2023.
//

import Foundation


struct NewNote {
    let id: String
    let gameName: String
    let title: String
    let text: String
    var date: String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("dd.MM.yyyy")
        return dateFormatter.string(from: date)
    }
    
    init(id: String, gameName: String, title: String, text: String) {
        self.id = id
        self.gameName = gameName
        self.title = title
        self.text = text
    }
}
