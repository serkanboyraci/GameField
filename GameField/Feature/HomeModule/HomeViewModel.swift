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
}

class HomeViewModel: HomeViewModelDelegate {
    var view: HomeViewControllerDelegate?
    
    func viewDidLoad() {
        
    }

    
    
}
