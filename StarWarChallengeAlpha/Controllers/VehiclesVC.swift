//
//  VehiclesVC.swift
//  StarWarChallengeAlpha
//
//  Created by mac on 7/20/19.
//  Copyright © 2019 wox. All rights reserved.
//

import UIKit

class VehiclesVC: UIViewController,PersonProtocol {
   
    @IBOutlet weak var passagerLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var length: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var manufacturerLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var previousButton: UIButton!
    
    var person: Person!

    let api = VehiclesApi()
    var vehicles = [String]()
    var currentVehicle = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        vehicles = person.vehicleUrls
        nextButton.isEnabled = vehicles.count > 1
        previousButton.isEnabled = false
        guard let firstvehicle = vehicles.first else {
            return
        }
        
        getVehicles(url: firstvehicle)
    }
    
    func getVehicles(url:String){
        api.getVehicles(url: url) { (vehicle) in
            
            if let vehicle = vehicle{
                self.setUpView(vehicle: vehicle)
            }
        }
        
    }
    
    
    func setUpView(vehicle:Vehicles){
        
        nameLabel.text = vehicle.name
        modelLabel.text = vehicle.model
        manufacturerLabel.text = vehicle.manufacturer
        costLabel.text = vehicle.cost
        length.text = vehicle.length
        speedLabel.text = vehicle.speed
        passagerLabel.text = vehicle.passengers

    }

    @IBAction func previousClicked(_ sender: Any) {
        
        currentVehicle -= 1
        print(vehicles[currentVehicle])
        setBUttonState()
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        
        currentVehicle += 1
        print(vehicles[currentVehicle])
        setBUttonState()
    }
    
    func setBUttonState(){
        
        nextButton.isEnabled = currentVehicle == vehicles.count - 1 ? false : true
        previousButton.isEnabled = currentVehicle == 0 ? false : true

//        if currentVehicle == 0 {
//            previousButton.isEnabled = false
//
//        }else{
//            previousButton.isEnabled = true
//        }
//
//        if currentVehicle == vehicles.count - 1{
//            nextButton.isEnabled = false
//        }
//        else{
//            nextButton.isEnabled = true
//        }
//
        getVehicles(url: vehicles[currentVehicle])
    }
    
    
}
