//
//  NoteListCell.swift
//  GameField
//
//  Created by Ali serkan Boyracı  on 21.01.2023.
//

import UIKit

class NoteListCell: UITableViewCell {
    
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var noteTitleLabel: UILabel!
    @IBOutlet weak var noteDateLabel: UILabel!
    
    //MARK: - Property
    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    //MARK: - Methods
    func configureCell(with model: Note){
        gameNameLabel.text = model.gameName
        noteDateLabel.text = model.date
        noteTitleLabel.text = model.text
        selectionStyle = .none
    }
}
