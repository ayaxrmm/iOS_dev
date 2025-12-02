//
//  HeroModel.swift
//  lab9
//
//  Created by Aya on 02.12.2025.
//

import Foundation

struct HeroModel: Decodable {
    let id: Int
    let name: String
    let biography: Biography
    let powerstats: Powerstats
    let appearance: Appearance
    let work: Work
    let images: Images
    
    struct Biography: Decodable {
        let fullName: String?
        let placeOfBirth: String?
        let publisher: String?
    }
    
    struct Powerstats: Decodable {
        let intelligence: Int?
        let strength: Int?
        let speed: Int?
        let durability: Int?
        let power: Int?
        let combat: Int?
    }
    
    struct Appearance: Decodable {
        let gender: String?
        let race: String?
        let height: [String]?
        let weight: [String]?
    }
    
    struct Work: Decodable {
        let occupation: String?
    }
    
    struct Images: Decodable {
        let md: String
    }
}

