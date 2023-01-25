//
//  FavoriteListViewModule.swift
//  GameField
//
//  Created by Ali serkan Boyracı  on 21.01.2023.
//

import Foundation

protocol FavoriteListViewModelInterface {
    var view: FavoriteListViewControllerDelegate? { get set}
    
    func viewDidLoad()
    func numberOfRowsInSection() -> Int
    func cellForRowItem(at index: Int) -> FavoriteGame
    func didSelectRowAt(at index: Int)
    func deleteButtonAction(at index: Int)
}

class FavoriteListViewModel: FavoriteListViewModelInterface {
    //MARK: - Property
    var view: FavoriteListViewControllerDelegate?
    var selectedFavoriteGame: FavoriteGame?
    private var favoriteGames = [FavoriteGame]() {
        didSet{
            view?.tableViewReloadData()
            debugPrint(favoriteGames.count)
        }
    }
    
    //MARK: - Lifecycle
    func viewDidLoad(){
        
        view?.prepareTableView()
        getFavoriteGames()
        favoriteStatusWillChange()
        
        
    }
    
    //MARK: - IBAction methods
    func deleteButtonAction(at index: Int) {
        let favoriGame = favoriteGames[index]
        CoreDataFavoriteGameClient.shared.deleteFavoriteGame(id: favoriGame.id!) { [weak self] result in
            switch result {
            case .success(let success):
                self?.view?.showSuccessAlert(message: success.message)
                self?.getFavoriteGames()
            case .failure(let error):
                self?.view?.showErrorAlert(message: error.message)
            }
        }
    }
    
    //MARK: -TableViewDataSourceMethods
    func numberOfRowsInSection() -> Int {
        favoriteGames.count
    }
    
    func cellForRowItem(at index: Int) -> FavoriteGame {
        favoriteGames[index]
    }
    
    //MARK: - TableViewDelegeteMethods
    func didSelectRowAt(at index: Int) {
        selectedFavoriteGame = favoriteGames[index]
        guard selectedFavoriteGame != nil else { return }
        view?.performSegue(identifier: Identifiers.favoriteListVCToDetailsVC)
    }
    
    //MARK: - Private methods
    @objc  func getFavoriteGames(){
        CoreDataFavoriteGameClient.shared.getAllFavoriteGame { [weak self] result in
            switch result {
            case .success(let favoriteGames):
                self?.favoriteGames = favoriteGames
            case .failure(let error):
                self?.view?.showErrorAlert(message: error.message)
            }
        }
    }
    
    private func favoriteStatusWillChange(){
        let name = CommunicationMessage.changedFavoriteStatus.rawValue
        CommunicationBetweenModules.shared.observe(observer: self,
                                                   name: name,
                                                   selector: #selector(getFavoriteGames))
    }
}
