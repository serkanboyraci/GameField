//
//  DetailsViewModel.swift
//  GameField
//
//  Created by Ali serkan Boyracı  on 20.01.2023.
//

import Foundation

protocol DetailsViewModelDelegate {
    var view: DetailsViewControllerDelegate? { get set }
    
    func viewDidLoad(id: Int)
}
class DetailsViewModel: DetailsViewModelDelegate {
    //MARK: - Property
    private lazy var networkManager: NetworkManagerProtocol = NetworkManager()
    var view: DetailsViewControllerDelegate?
    
    //MARK: - Lifecycle
    func viewDidLoad(id: Int) {
        getGameDetails(by: id)
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
}
