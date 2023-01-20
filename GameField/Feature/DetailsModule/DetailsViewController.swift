//
//  DetailsViewController.swift
//  GameField
//
//  Created by Ali serkan Boyracı  on 20.01.2023.
//

import UIKit
import Kingfisher
protocol DetailsViewControllerDelegate: Alert, NavigationPushable {
    func dataNotFound()
    func prepareInterfaceComponent(game: GameDetail)
    func changeButtonColor(_ gameIsFavorite: Bool)
}

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    private lazy var viewModel: DetailsViewModelDelegate = DetailsViewModel()
    var id: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let id else { return }
        viewModel.id = id
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    
    @IBAction func favoriteButtonClicked(_ sender: Any) {
        viewModel.favoriteButtonClicked()
    }
}

//MARK: - DetailsViewControllerDelegate
extension DetailsViewController: DetailsViewControllerDelegate {
    func dataNotFound() {
        DispatchQueue.main.async { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
    
    func prepareInterfaceComponent(game: GameDetail) {
        nameLabel.text = game.name
        ratingLabel.text = game.rating.toString()
        textView.text = game.descriptionRaw
        let url = URL(string: game.backgroundImageAdditional)
        imageView.kf.setImage(with: url)
    }
    
    func changeButtonColor(_ gameIsFavorite: Bool) {
        favoriteButton.tintColor = gameIsFavorite ? .systemRed : .lightGray
    }
}
