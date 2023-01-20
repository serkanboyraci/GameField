//
//  HomeCollectionViewCell.swift
//  GameField
//
//  Created by Ali serkan Boyracı  on 19.01.2023.
//

import UIKit
import Kingfisher

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
        layer.backgroundColor = UIColor.white.cgColor
        layer.cornerRadius = 15
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        ratingLabel.text = "Rate: " + model.rating.toString()
        nameLabel.text = model.name
        let url = URL(string: model.imageUrl)
        backgroundImage.kf.setImage(with: url,placeholder: UIImage(systemName: "photo"))
    }
}
