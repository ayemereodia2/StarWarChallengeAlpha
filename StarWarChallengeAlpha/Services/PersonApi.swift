//
//  PersonApi.swift
//  StarWarChallengeAlpha
//
//  Created by mac on 7/12/19.
//  Copyright © 2019 wox. All rights reserved.
//

import Foundation

class PersonApi {
    
    
    func getRandomPersonUrlSession(id:Int, completion:@escaping personReturnCompletion){
        
        guard let url = URL(string: "\(PEOPLE_URL)\(id)") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else{
                
                debugPrint(error.debugDescription)
                completion(nil)
                return
            }
            
            guard let data = data else{
                return
            }
            
            do{
                
                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
                guard let json = jsonAny as? [String:Any] else {return}
                
               let person = self.parsePersonManually(person: json)
                DispatchQueue.main.async {
                    completion(person)

                }

            }
            catch{
                
            }

        }
        task.resume()
    }
    
    private func parsePersonManually(person:[String:Any])->Person {
        
        let name = person["name"] as? String ?? ""
        let height = person["height"] as? String ?? ""
        let mass = person["mass"] as? String ?? ""
        let hair = person["hair_color"] as? String ?? ""
        let birthYear = person["birth_year"] as? String ?? ""
        let gender = person["gender"] as? String ?? ""
        let homeworldUrl = person["homeworld"] as? String ?? ""
        let filmUrls = person["films"] as? [String] ?? [String]()
        let vehicleUrls = person["vehicles"] as? [String] ?? [String]()
        let starshipUrls = person["starships"] as? [String] ?? [String]()

        let personmodel = Person(name:name,height:height,mass:mass,hair:hair,birthYear:birthYear,gender:gender,hellowordUrl:homeworldUrl,filmUrls:filmUrls,vehicleUrls:vehicleUrls,starshipUrls:starshipUrls)
        
        return personmodel
    }
}
