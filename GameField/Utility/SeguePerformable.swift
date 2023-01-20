//
//  SeguePerformable.swift
//  GameField
//
//  Created by Ali serkan Boyracı  on 20.01.2023.
//
import UIKit

protocol SeguePerformable {
    func performSegue(identifier: String)
}

extension SeguePerformable where Self: UIViewController {
    func performSegue(identifier: String){
        performSegue(withIdentifier: identifier, sender: self)
    }
}
