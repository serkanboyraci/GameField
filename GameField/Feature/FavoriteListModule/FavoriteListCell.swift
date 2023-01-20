//
//  FavoriteListCell.swift
//  GameField
//
//  Created by Ali serkan Boyracı  on 21.01.2023.
//

import UIKit

class FavoriteListCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!

    //MARK: - Property
    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    //MARK: - Methods
    func configureCell(with favoriteGame: FavoriteGame){
        nameLabel.text = favoriteGame.name
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = ""
    }
    
}

