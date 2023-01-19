//
//  HomeModel.swift
//  GameField
//
//  Created by Ali serkan Boyracı  on 19.01.2023.
//

import Foundation

struct Game: Decodable {
    let id: Int
    let name: String
    let rating: Double
    let imageUrl: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case rating
        case imageUrl
    }
}


struct GameResponseModel:  Decodable {
    let count: Int
    let next: String
    let results: [Game]
}

