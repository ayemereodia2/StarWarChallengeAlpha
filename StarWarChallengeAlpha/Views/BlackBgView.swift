//
//  BlackBgView.swift
//  StarWarChallengeAlpha
//
//  Created by mac on 7/12/19.
//  Copyright © 2019 wox. All rights reserved.
//

import UIKit

class BlackBgView: UIView {
    
    
    override func awakeFromNib() {
        layer.backgroundColor = BLACK_BG_COLOR
        layer.cornerRadius = 10
    }
}

class BlackBgButton: UIButton {
    
    override func awakeFromNib() {
        layer.backgroundColor = BLACK_BG_COLOR
        layer.cornerRadius = 10
    }
}
