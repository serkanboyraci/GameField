//
//  DetailsViewController.swift
//  GameField
//
//  Created by Ali serkan Boyracı  on 20.01.2023.
//

import UIKit
import Kingfisher
protocol DetailsViewControllerDelegate {
    func prepareInterfaceComponent(game: GameDetail)
}

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!

    @IBOutlet weak var ratingLabel: UILabel!
    
    private lazy var viewModel: DetailsViewModelDelegate = DetailsViewModel()
    var id: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            guard let id else { return }
            viewModel.view = self
            viewModel.viewDidLoad(id: id)

    }
}
extension DetailsViewController: DetailsViewControllerDelegate {
    func prepareInterfaceComponent(game: GameDetail) {
        nameLabel.text = game.name
        ratingLabel.text = game.rating.toString()
        textView.text = game.descriptionRaw
        let url = URL(string: game.backgroundImageAdditional)
        imageView.sd_setImage(with: url)
    }
}
