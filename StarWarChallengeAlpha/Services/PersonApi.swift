//
//  PersonApi.swift
//  StarWarChallengeAlpha
//
//  Created by mac on 7/12/19.
//  Copyright © 2019 wox. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PersonApi {
    
    
    // Web request using Alamo and Codable
    
       func getPersonUsingAlamoFireCodable(id: Int,completion:@escaping personReturnCompletion )  {
        
                guard let url = URL(string: "\(PEOPLE_URL)\(1)") else {return}
        
                Alamofire.request(url).responseJSON { (response) in
        
                    if let error = response.result.error{
                        debugPrint(error.localizedDescription)
                        completion(nil)
                       return
                    }
        
                    guard let data =  response.data else{
                        return completion(nil)
                    }
                    let jsondecoder = JSONDecoder()
                    do{
                        let person = try jsondecoder.decode(Person.self, from: data)
                        //let person = self.parsePersonSwifty(person: json)
                        completion(person)
                        
                    }
                    catch
                    {
                        debugPrint(error.localizedDescription)
                        completion(nil)
                    }
                }
        
            }
    
    
    
    //Web request with AlamoFire and SwiftyJSON
    
    func getPersonUsingAlamoFireJSON(id: Int,completion:@escaping personReturnCompletion )  {
        
        guard let url = URL(string: "\(PEOPLE_URL)\(id)") else {return}
        
        Alamofire.request(url).responseJSON { (response) in
            
            if let error = response.result.error{
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data =  response.data  else{
                return completion(nil)
            }
            
            do{
                let json = try JSON(data: data)
                let person = self.parsePersonSwifty(person: json)
                completion(person)

            }
            catch
            {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
        
    }
    
    //using ALAMOFIRE
//    func getPersonUsingAlamoFire(id: Int,completion:@escaping personReturnCompletion )  {
//
//        guard let url = URL(string: "\(PEOPLE_URL)\(id)") else {return}
//
//        Alamofire.request(url).responseJSON { (response) in
//
//            if let error = response.result.error{
//                debugPrint(error.localizedDescription)
//                completion(nil)
//               return
//            }
//
//            guard let json =  response.result.value as? [String:Any] else{
//                return completion(nil)
//            }
//
//           let person = self.parsePersonManually(person: json)
//            completion(person)
//        }
//
//    }
    
    
    
    // using URL Session
//    func getRandomPersonUrlSession(id:Int, completion:@escaping personReturnCompletion){
//
//        guard let url = URL(string: "\(PEOPLE_URL)\(id)") else {return}
//
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//
//            guard error == nil else{
//
//                debugPrint(error.debugDescription)
//                completion(nil)
//                return
//            }
//
//            guard let data = data else{
//                return
//            }
//
//            do{
//
//                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
//                guard let json = jsonAny as? [String:Any] else {return}
//
//               let person = self.parsePersonManually(person: json)
//                DispatchQueue.main.async {
//                    completion(person)
//
//                }
//
//            }
//            catch{
//
//            }
//
//        }
//        task.resume()
//    }
    
    //Swifty JSON
    private func parsePersonSwifty(person:JSON)->Person {
        
        let name = person["name"].stringValue
        let height = person["height"].stringValue
        let mass = person["mass"].stringValue
        let hair = person["hair_color"].stringValue
        let birthYear = person["birth_year"].stringValue
        let gender = person["gender"].stringValue
        let homeworldUrl = person["homeworld"].stringValue
        let filmUrls = person["films"].arrayValue.map({$0.stringValue})
        let vehicleUrls = person["vehicles"].arrayValue.map({$0.stringValue})
        let starshipUrls = person["starships"].arrayValue.map({$0.stringValue})
        
        let personmodel = Person(name:name,height:height,mass:mass,hair:hair,birthYear:birthYear,gender:gender,hellowordUrl:homeworldUrl,filmUrls:filmUrls,vehicleUrls:vehicleUrls,starshipUrls:starshipUrls)
        
        return personmodel
        
    }
    // Manual Parsing
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
