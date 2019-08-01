//
//  StarShipApi.swift
//  StarWarChallengeAlpha
//
//  Created by mac on 7/27/19.
//  Copyright © 2019 wox. All rights reserved.
//

import Foundation
import Alamofire

class StarShipApi {
    
    func getStarShipApi(url:String, completion: @escaping starShipCompletion ){
        
        guard let url = URL(string: url) else{return}
        
        Alamofire.request(url).responseJSON { (response) in
            
            if let error = response.result.error{
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data =  response.data else {return}
            
            let jsondecoder = JSONDecoder()
            
            do{
                let ship = try jsondecoder.decode(StarShip.self, from: data)
                completion(ship)
            }
            catch{
               
                debugPrint(error.localizedDescription)
                completion(nil)
                
            }
            
            
        }
    }
}
