//
//  DetailsModel.swift
//  GameField
//
//  Created by Ali serkan Boyracı  on 20.01.2023.
//

import Foundation

struct GameDetail: Decodable {
    let id: Int
    let name: String
    let nameOriginal:  String
    let gameDescription:  String
    let descriptionRaw:  String
    let rating : Double
    let backgroundImage: String
    let backgroundImageAdditional: String
    
    private enum CodingKeys: String, CodingKey {
        case id, name
        case nameOriginal = "name_original"
        case gameDescription = "description"
        case rating
        case descriptionRaw = "description_raw"
        case backgroundImage = "background_image"
        case backgroundImageAdditional = "background_image_additional"
    }
}
