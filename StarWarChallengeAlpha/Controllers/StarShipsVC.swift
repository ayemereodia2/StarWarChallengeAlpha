//
//  StarShipsVC.swift
//  StarWarChallengeAlpha
//
//  Created by mac on 7/20/19.
//  Copyright © 2019 wox. All rights reserved.
//

import UIKit

class StarShipsVC: UIViewController, PersonProtocol {
    var person: Person!
    
    @IBOutlet weak var costLabel: UILabel!
    
    @IBOutlet weak var passengerLabel: UILabel!
    @IBOutlet weak var crewLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var makeLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var prevButton: UIButton!
    var starShip = [String]()
    var currentShip = 0
    let api = StarShipApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(person.name)

        starShip = person.starshipUrls
        print(starShip)
        
        nextButton.isEnabled = starShip.count > 1
        prevButton.isEnabled = false
        
        guard let firstShipUrl = starShip.first else{
            return
        }
        
        getStarShip(url: firstShipUrl)
        // Do any additional setup after loading the view.
    }
    
    
    func getStarShip(url:String){
        api.getStarShipApi(url: url) { (ship) in
            
            if let ship = ship{
                self.setUpViews(ship: ship)
            }
        }
    }
    
    func setUpViews(ship:StarShip){
        passengerLabel.text = ship.passengers
        crewLabel.text = ship.crew
        lengthLabel.text = ship.length
        makeLabel.text = ship.make
        modelLabel.text = ship.model
        nameLabel.text = ship.name
        costLabel.text = ship.cost
    }
    
   
    @IBAction func prevClicked(_ sender: Any) {
        currentShip -= 1
        print(starShip[currentShip])
        setBUttonState()
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        currentShip += 1
        print(starShip[currentShip])
        setBUttonState()
    }
    
    func setBUttonState(){
        
        nextButton.isEnabled = currentShip == starShip.count - 1 ? false : true
        prevButton.isEnabled = currentShip == 0 ? false : true
        
        getStarShip(url: starShip[currentShip])
    }
}
