//
//  HomeWorldVC.swift
//  StarWarChallengeAlpha
//
//  Created by mac on 7/20/19.
//  Copyright © 2019 wox. All rights reserved.
//

import UIKit

class HomeWorldVC: UIViewController,PersonProtocol {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var climateLabel: UILabel!
    
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var terrainLabel: UILabel!
    let api = HomeWorldApi()
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        api.getHomeWorld(url: person.hellowordUrl) { (home) in
            
            if let home = home{
                self.setUpUI(homeworld: home)
            }
        }
        print(person.name)
    }
    

    func setUpUI(homeworld:HomeWorld) {
        
        nameLabel.text = homeworld.name
        climateLabel.text = homeworld.climate
        terrainLabel.text = homeworld.terrain
        populationLabel.text = homeworld.population
    }

}
