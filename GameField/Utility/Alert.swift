//
//  Alert.swift
//  GameField
//
//  Created by Ali serkan Boyracı  on 20.01.2023.
//
import UIKit
import ProgressHUD


protocol Alert {
    func showErrorAlert(message: String)
    func showSuccessAlert(message: String)
    func startProgressAnimating()
    func stopAnimating()
}

extension Alert where Self: UIViewController {
    func showErrorAlert(message: String) {
        ProgressHUD.colorBackground = .lightGray
        ProgressHUD.colorStatus = .red
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.2, execute: {
            ProgressHUD.showError(message)
        })
    }
    
    func showSuccessAlert(message: String) {
        ProgressHUD.fontStatus = .boldSystemFont(ofSize: 30)
        ProgressHUD.colorBackground = .darkGray
        ProgressHUD.showSuccess(message)
        
    }
    
    func startProgressAnimating(){
        ProgressHUD.colorBackground = .lightGray
        ProgressHUD.colorAnimation = .blue
        ProgressHUD.animationType = .circleSpinFade
        ProgressHUD.show(interaction: false)
    }
    
    func stopAnimating(){
        ProgressHUD.dismiss()
    }
}
