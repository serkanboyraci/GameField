//
//  DetailsViewModel.swift
//  GameField
//
//  Created by Ali serkan Boyracı  on 20.01.2023.
//

import Foundation

protocol DetailsViewModelDelegate {
    var view: DetailsViewControllerDelegate? { get set }
    var id: Int! { get set }
    func viewDidLoad()
    func favoriteButtonClicked()
}

final class DetailsViewModel: DetailsViewModelDelegate {
    //MARK: - Property
    private lazy var networkManager: NetworkManagerProtocol = NetworkManager()
    var view: DetailsViewControllerDelegate?
    var id: Int!
    var game: GameDetail?
    var gameIsFavorite: Bool = false
    
    
    //MARK: - Lifecycle
    func viewDidLoad() {
        getGameDetails(by: id)
        getGameIsFavorite()
    }
    
    // Methods
    func favoriteButtonClicked() {
        guard let game else { return }
        if !gameIsFavorite {
            CoreDataFavoriteGameClient.shared.saveFavoriteGame(id: id.toString(), name: game.name){ [weak self] result in
                switch result {
                case .success(let success):
                    self?.view?.showSuccessAlert(message: success.message)
                case .failure(let error):
                    self?.view?.showErrorAlert(message: error.message)
                    return
                }
            }
        } else {
            CoreDataFavoriteGameClient.shared.deleteFavoriteGame(id: id.toString()){ [weak self] result in
                switch result {
                case .success(let success):
                    self?.view?.showSuccessAlert(message: success.message)
                case .failure(let error):
                    self?.view?.showErrorAlert(message: error.message)
                    return
                }
            }
        }
        gameIsFavorite.toggle()
        view?.changeButtonColor(gameIsFavorite)
        favoriteStatusDidChanged()
    }
    
    //MARK: - Private Methods
    func getGameDetails(by id: Int){
        view?.startProgressAnimating()
        networkManager.getGameDetails(by: id) { [weak self] result in
            self?.view?.stopAnimating()
            switch result {
            case .failure(_):
                self?.sendNotificationForDataNotFound()
                self?.view?.popViewController()
                
            case .success(let game):
                self?.view?.prepareInterfaceComponent(game: game)
                self?.game = game
            }
        }
    }
    
    func getGameIsFavorite(){
        guard let _ = CoreDataFavoriteGameClient.shared.getFavoriteGame(by: id.toString()) else {
            self.gameIsFavorite = false
            view?.changeButtonColor(false)
            return
        }
        gameIsFavorite = true
        view?.changeButtonColor(true)
    }
    
    private func favoriteStatusDidChanged(){
        CommunicationBetweenModules.shared.post(name: CommunicationMessage.changedFavoriteStatus.rawValue)
    }
    
    private func sendNotificationForDataNotFound(){
        CommunicationBetweenModules.shared.post(name: CommunicationMessage.favoriteGameDetailDataNotFound.rawValue)
    }
}
