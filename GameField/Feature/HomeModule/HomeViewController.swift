//
//  HomeViewController.swift
//  GameField
//
//  Created by Ali serkan Boyracı  on 19.01.2023.
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    func prepareCollectionView()
    func collectionViewReloadData()
    
    
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

//MARK: - CollectionViewDataSource
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

//MARK: - HomepageViewControllerDelegate
extension HomeViewController: HomeViewControllerDelegate {
    func collectionViewReloadData() {
        gameCollectionView.reloadData()
    }
    
    func prepareCollectionView() {
        gameCollectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionViewConfig()
        gameCollectionView.backgroundColor = .systemGray3
        gameCollectionView.dataSource = self
        gameCollectionView.register(HomeCollectionViewCell.nib, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
    }
    
    
    private func collectionViewConfig(){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 20
        let width = gameCollectionView.frame.size.width
        let cellWidth = (width - 30) / 2
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth * 1.1)
        gameCollectionView.collectionViewLayout = flowLayout
    }
}

//MARK: - UISearchResultsUpdating
extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let text = searchController.searchBar.text
        viewModel.updateSearchResults(text: text)
    }
}

