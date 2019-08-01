//
//  Films.swift
//  StarWarChallengeAlpha
//
//  Created by mac on 7/30/19.
//  Copyright © 2019 wox. All rights reserved.
//

import Foundation

struct Films:Codable {
    
    let title:String
    let episode:Int
    let director:String
    let crawl:String
    let producer:String
    let releaseDate:String
    
    enum CodingKeys:String,CodingKey {
        case title
        case episode = "episode_id"
        case director
        case crawl = "opening_crawl"
        case producer
        case releaseDate = "release_date"
    }
}
