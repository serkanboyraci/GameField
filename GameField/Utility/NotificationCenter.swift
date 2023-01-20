//
//  NotificationCenter.swift
//  GameField
//
//  Created by Ali serkan Boyracı  on 20.01.2023.
//
import UIKit

class CommunicationBetweenModules {
    static let shared = CommunicationBetweenModules()
    
    private init() {}
    
    func post(name: String){
        NotificationCenter.default.post(name: NSNotification.Name(name), object: nil)
    }
    
    func observe(observer: Any, name: String, selector: Selector){
        NotificationCenter.default.addObserver(observer, selector: selector, name: NSNotification.Name(name), object: nil)
    }
}

enum CommunicationMessage:String {
    case changedFavoriteStatus = "changedFavoriteStatus"
    case gameDetailDataNotFound = "gameDetailDataNotFound"
    case favoriteGameDetailDataNotFound = "favoriteGameDetailDataNotFound"
    case noteListChanged = "noteListChanged"
}
