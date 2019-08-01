//
//  FilmsApi.swift
//  StarWarChallengeAlpha
//
//  Created by mac on 7/30/19.
//  Copyright © 2019 wox. All rights reserved.
//

import Foundation
import Alamofire

class FilmsApi{
    
    func getFilms(url:String, completion:@escaping filmCollection) {
        
        guard let url = URL(string: url) else{return}
        
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error{
                
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else{return completion(nil)}
            let jsondecoder = JSONDecoder()
            
            do{
                
                let films = try jsondecoder.decode(Films.self, from: data)
                completion(films)
                
            }
            catch{
                
                debugPrint(error.localizedDescription)
                completion(nil)
            }
            
        }
        
    }
    
}
