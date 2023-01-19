//
//  HomeViewController.swift
//  GameField
//
//  Created by Ali serkan Boyracı  on 19.01.2023.
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    func prepareCollectionView()
        
}


class HomeViewController: UIViewController {
    
    @IBOutlet weak var gameCollectionView: UICollectionView!
    
    private lazy var viewModel: HomeViewModelDelegate = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad() 
    }
}
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier ,for: indexPath) as? HomeCollectionViewCell else {
            print("xib not found")
            return .init()
        }
        guard let game = viewModel.cellForItemAt(at: indexPath) else { return .init() }
        
        cell.configureCell(with: game)
        return cell
    }
}


extension HomeViewController: HomeViewControllerDelegate {
    func prepareCollectionView() {
        gameCollectionView.dataSource = self
        gameCollectionView.register(HomeCollectionViewCell.nib, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
    }
        
}

