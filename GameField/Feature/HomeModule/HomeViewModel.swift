//
//  HomeViewModel.swift
//  GameField
//
//  Created by Ali serkan Boyracı  on 19.01.2023.
//

import Foundation

protocol HomeViewModelDelegate {
    var view: HomeViewControllerDelegate? {get set}
    
    func viewDidLoad()
    func numberOfItemsInSection() -> Int
    func cellForItemAt(at indexPath: IndexPath) -> Game?
    func updateSearchResults(text: String?)
}

class HomeViewModel: HomeViewModelDelegate {
    func viewDidLoad() {
        <#code#>
    }
    
    func numberOfItemsInSection() -> Int {
        <#code#>
    }
    
    func cellForItemAt(at indexPath: IndexPath) -> Game? {
        <#code#>
    }
    
    func updateSearchResults(text: String?) {
        <#code#>
    }
    
    weak var view: HomeViewControllerDelegate?
    
    private var gameList = [Game]() {
        private var mainGameList = [Game](){
            didSet{
                filteredGameList = mainGameList
            }
        }
        private var filteredGameList = [Game](){
        didSet{
            view?.collectionViewReloadData()
        }
    }
    
    func viewDidLoad() {
        view?.prepareCollectionView()
        view?.prepareSearchController()
        getAllGames()
    
    }
    func numberOfItemsInSection() -> Int {
        filteredGameList.count
    }
    
    func cellForItemAt(at indexPath: IndexPath) -> Game? {
        filteredGameList[indexPath.row]
    }
        
        func updateSearchResults(text: String?) {
            if text.isNilOrEmpty {
                filteredGameList = mainGameList
                
            } else {
                filteredGameList = mainGameList.filter({ $0.name.uppercased().contains(text!.uppercased())})
            }
    }
    
    
    //MARK: - Private Methods
    func getAllGames(){
        NetworkManager.shared.getAllGames(queryItems: []) {[weak self] result in
            guard let self else { return }
            switch result {
            case .success(let games):
                self.mainGameList = games
            case .failure(let error):
                print(error)
            }
        }
    }
    


    
    
}
