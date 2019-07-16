//
//  Constants.swift
//  StarWarChallengeAlpha
//
//  Created by mac on 7/12/19.
//  Copyright © 2019 wox. All rights reserved.
//

import UIKit

let BLACK_BG_COLOR = UIColor.black.withAlphaComponent(0.6).cgColor

let BASE_ULR = "https://swapi.co/api/"

let PEOPLE_URL = BASE_ULR + "people/"

typealias personReturnCompletion = (Person?)->()
