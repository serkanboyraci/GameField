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
    
    var gameList = [Game]()
    
    func viewDidLoad() {
    
    }
    func numberOfItemsInSection() -> Int {
        gameList.count
    }
    
    func cellForItemAt(at indexPath: IndexPath) -> Game? {
        gameList[indexPath.row]
    }
    
}
