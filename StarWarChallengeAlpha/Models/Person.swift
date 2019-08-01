//
//  Person.swift
//  StarWarChallengeAlpha
//
//  Created by mac on 7/13/19.
//  Copyright © 2019 wox. All rights reserved.
//

import Foundation

struct Person:Codable {
    let name:String
    let height:String
    let mass:String
    let hair:String
    let birthYear:String
    let gender:String
    let hellowordUrl:String
    let filmUrls:[String]
    let vehicleUrls:[String]
    let starshipUrls:[String]
    
    
    enum CodingKeys:String,CodingKey{
        case name
        case height
        case mass
        case hair = "hair_color"
        case birthYear = "birth_year"
        case gender
        case hellowordUrl = "homeworld"
        case filmUrls = "films"
        case vehicleUrls = "vehicles"
        case starshipUrls = "starships"
    }
}
