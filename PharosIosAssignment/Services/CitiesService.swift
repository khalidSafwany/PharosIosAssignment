//
//  CitiesService.swift
//  PharosIosAssignment
//
//  Created by Khalid hassan on 8/20/22.
//

import Foundation

struct CitiesService {
    
    
    func getCities(pageNumber:Int, completion: @escaping ([City]?, Error?) -> () ){

        let urlRequest = URL(string: URLs.getCitiesUrl(pageNumber))
            URLSession.shared.dataTask(with: urlRequest!) { (data, response, error) in
                
               
                if error != nil {
                    print(error!)
                    completion(nil, error)
                    return
                }
                guard let data = data else {
                    completion(nil, error)
                    return
                }
                do{
                    let decodedCities = try JSONDecoder().decode([City].self, from: data)
                    DispatchQueue.main.async() {
                        completion(decodedCities, nil)
                    }

                    
                }catch let err as NSError{
                    print("Catch Error: \(err)")
                }
            
            }.resume()
            
            
            
        }
    
    
    
}
