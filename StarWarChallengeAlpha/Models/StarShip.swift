//
//  StarShip.swift
//  StarWarChallengeAlpha
//
//  Created by mac on 7/27/19.
//  Copyright © 2019 wox. All rights reserved.
//

import Foundation

struct StarShip:Codable {
    let name:String
    let model:String
    let make:String//manufacturer
    let cost:String//cost_in_credit
    let length:String
    let crew:String
    let passengers:String
    
    
    enum CodingKeys:String,CodingKey {
        
        case name
        case model
        case make = "manufacturer"
        case cost = "cost_in_credits"
        case length
        case crew
        case passengers
    }
    
}
