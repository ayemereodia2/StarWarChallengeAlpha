//
//  VehiclesApi.swift
//  StarWarChallengeAlpha
//
//  Created by mac on 7/22/19.
//  Copyright © 2019 wox. All rights reserved.
//

import Foundation
import Alamofire


class VehiclesApi {
    func getVehicles(url:String, completion: @escaping vehiclesCompletion)  {
        guard let url = URL(string: url) else{return}
        
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            guard let data = response.data else {return}
            
            let jsondecoder = JSONDecoder()
            
            do{
                
                let vehicles = try jsondecoder.decode(Vehicles.self, from: data)
                completion(vehicles)
            }
            catch{
                
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
