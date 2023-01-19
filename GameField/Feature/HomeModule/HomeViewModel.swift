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
}

class HomeViewModel: HomeViewModelDelegate {
    weak var view: HomeViewControllerDelegate?
    
    var gameList = [Game]() {
        didSet{
            view?.collectionViewReloadData()
        }
    }
    
    func viewDidLoad() {
        view?.prepareCollectionView()
        getAllGames()
    
    }
    func numberOfItemsInSection() -> Int {
        gameList.count
    }
    
    func cellForItemAt(at indexPath: IndexPath) -> Game? {
        gameList[indexPath.row]
    }
    
    
    //MARK: - Private Methods
    private func getAllGames(){
        NetworkManager.shared.getAllGames(queryItems: []) {[weak self] result in
            guard let self else { return }
            switch result {
            case .success(let games):
                self.gameList = games
            case .failure(let error):
                print(error)
            }
        }
    }
    


    
    
}
