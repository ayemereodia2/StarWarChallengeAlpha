//
//  Vehicles.swift
//  StarWarChallengeAlpha
//
//  Created by mac on 7/22/19.
//  Copyright © 2019 wox. All rights reserved.
//

import Foundation

struct Vehicles : Codable {
    let name:String?
    let model:String?
    let manufacturer:String?
    let cost:String?
    let length:String?
    let speed:String?
    let crew:String?
    let passengers:String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case manufacturer
        case cost = "cost_in_credits"
        case length
        case speed = "max_atmosphering_speed"
        case crew
        case passengers
    }
}
