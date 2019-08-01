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
    
    @IBOutlet weak var homworldButton: UIButton!
    
    @IBOutlet weak var vehiclesButton: UIButton!
    
    @IBOutlet weak var starshipButton: UIButton!
    
    @IBOutlet weak var filmsButton: UIButton!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    var api = PersonApi()
    
    var person:Person!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    @IBAction func randomClicked(_ sender: Any) {
        let random = Int.random(in: 1...87)
        
        spinner.startAnimating()
        api.getPersonUsingAlamoFireCodable(id: random) { (person) in
            if let person = person {
                self.spinner.stopAnimating()
                self.setUpView(person: person)
                
                self.person = person
            }
        }
    }
    
    func setUpView(person:Person){
        
        nameLabel.text = person.name
        heightLabel.text = person.height
        dateOfBirthLabe.text = person.birthYear
        massLabel.text = person.mass
        hairColorlabel.text = person.hair
        genderLabel.text = person.gender
        
        starshipButton.isEnabled = !person.starshipUrls.isEmpty
        filmsButton.isEnabled = !person.filmUrls.isEmpty
        homworldButton.isEnabled = !person.hellowordUrl.isEmpty
        vehiclesButton.isEnabled = !person.vehicleUrls.isEmpty
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if var destination = segue.destination as? PersonProtocol{
            destination.person = person
        }
//        switch segue.identifier {
//        case Segue.homeWorld.rawValue:
//            if let destination = segue.destination as? HomeWorldVC{
//
//                destination.person = person
//            }
//        case Segue.vehicles.rawValue:
//            if let destination = segue.destination as? VehiclesVC{
//
//                destination.person = person
//            }
//        case Segue.ships.rawValue:
//            if let destination = segue.destination as? StarShipsVC{
//
//                destination.person = person
//            }
//        case Segue.films.rawValue:
//            if let destination = segue.destination as? FilmsVC{
//
//                destination.person = person
//            }
//        default:
//            break
//        }
    
}
//    enum Segue:String {
//        case homeWorld = "toHomeWorld"
//        case vehicles = "toVehicles"
//        case  ships = "toShips"
//        case films = "toFilms"
//    }
}

protocol PersonProtocol {
    
    var person:Person! {get set}
}
