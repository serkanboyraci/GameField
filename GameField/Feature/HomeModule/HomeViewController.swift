//
//  HomeViewController.swift
//  GameField
//
//  Created by Ali serkan Boyracı  on 19.01.2023.
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject,SeguePerformable,Alert {
    func prepareComponents()
    func collectionViewReloadData()
}

final class HomeViewController: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet private weak var gameCollectionView: UICollectionView!
    
    //MARK: - Property
    private var viewModel = HomeViewModel()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
        
    }
    
    //MARK: - Override Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsVC = segue.destination as? DetailsViewController else { return }
        detailsVC.id = viewModel.getGameID()
    }
    @IBAction func menuButtonCicked(_ sender: Any) {
  
    }
    
    
    
    //MARK: - Private Methods
    private func prepareCollectionView() {
        gameCollectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionViewConfig()
        gameCollectionView.backgroundColor = .systemGray3
        gameCollectionView.dataSource = self
        gameCollectionView.delegate = self
        gameCollectionView.register(HomeCollectionViewCell.nib, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
    }
    
    private func prepareSearchController(){
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        //search.searchBar.placeholder = LocalizableConstant.searchBarPlaceholder
        search.searchBar.barTintColor = .systemIndigo
        search.searchBar.searchTextField.textColor = .darkGray
        search.searchBar.searchTextField.tokenBackgroundColor = .red
        search.searchBar.searchTextField.backgroundColor = .white
        search.searchBar.layer.borderWidth = 1
        search.searchBar.layer.borderColor = UIColor.systemIndigo.cgColor
        navigationItem.searchController = search
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
        guard let game = viewModel.cellForItemAt(at: indexPath.row) else { return .init() }
        
        cell.configureCell(with: game)
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectItemAt(at: indexPath.row)
    }
}

//MARK: - HomepageViewControllerDelegate
extension HomeViewController: HomeViewControllerDelegate {
    func prepareComponents() {
        view.backgroundColor = .systemGray3
        navigationItem.title = "RAWG"
        prepareCollectionView()
        prepareSearchController()
    }
    
    func collectionViewReloadData() {
        gameCollectionView.reloadData()
    }
}

//MARK: - UISearchResultsUpdating
extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let text = searchController.searchBar.text
        viewModel.updateSearchResults(text: text)
    }
}
