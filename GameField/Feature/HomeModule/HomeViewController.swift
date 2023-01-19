//
//  HomeViewController.swift
//  GameField
//
//  Created by Ali serkan Boyracı  on 19.01.2023.
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    
    
}

class HomeViewController: UIViewController {
    
    private lazy var viewModel: HomeViewModelDelegate = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad() 
    }
}
extension HomeViewController: HomeViewControllerDelegate {
    
}
