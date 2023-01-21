//
//  NavigationPresentable.swift
//  GameField
//
//  Created by Ali serkan Boyracı  on 20.01.2023.
//

import UIKit

protocol NavigationPresentable {
    func present(with viewControllerID: String)
    func dismiss()
}

extension NavigationPresentable where Self: UIViewController {
    func present(with viewControllerID: String) {
        let viewController = storyboard!.instantiateViewController(identifier: viewControllerID)
        present(viewController, animated: true, completion: nil)
    }
    
    func dismiss() {
        dismiss(animated: true)
    }
}
