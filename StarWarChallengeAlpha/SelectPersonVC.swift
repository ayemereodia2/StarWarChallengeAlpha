//
//  ViewController.swift
//  StarWarChallengeAlpha
//
//  Created by mac on 7/11/19.
//  Copyright © 2019 wox. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var massLabel: UILabel!
    
    @IBOutlet weak var hairColorlabel: UILabel!
    
    @IBOutlet weak var dateOfBirthLabe: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    var api = PersonApi()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    @IBAction func randomClicked(_ sender: Any) {
        let random = Int.random(in: 1...87)
        
        
        api.getRandomPersonUrlSession(id: random) { (person) in
            if let person = person {
                self.nameLabel.text = person.name
                self.heightLabel.text = person.height
                self.dateOfBirthLabe.text = person.birthYear
                self.massLabel.text = person.mass
                self.hairColorlabel.text = person.hair
                self.genderLabel.text = person.gender
            }
        }
    }
    

}

