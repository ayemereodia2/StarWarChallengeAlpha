//
//  HomeWorldApi.swift
//  StarWarChallengeAlpha
//
//  Created by mac on 7/21/19.
//  Copyright © 2019 wox. All rights reserved.
//

import Foundation
import Alamofire

class HomeWorldApi {
    
    func getHomeWorld(url:String, completion: @escaping homeWorldCompletion)  {
        guard let url = URL(string: url) else{return}
        
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error{
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            guard let data = response.data else {return}
            
            let jsondecoder = JSONDecoder()
            
            do{
               
                let homeworld = try jsondecoder.decode(HomeWorld.self, from: data)
                completion(homeworld)
            }
            catch{
                
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
    
}
