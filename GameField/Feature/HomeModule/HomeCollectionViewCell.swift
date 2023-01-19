//
//  HomeCollectionViewCell.swift
//  GameField
//
//  Created by Ali serkan Boyracı  on 19.01.2023.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    //MARK: - Property
    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func prepareForReuse() {
        backgroundImage.image = UIImage(systemName: "photo")
        ratingLabel.text = ""
        nameLabel.text = ""
    }
    
    func configureCell(with model: Game) {
        
    }
}
