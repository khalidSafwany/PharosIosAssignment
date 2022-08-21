//
//  Coordinates.swift
//  PharosIosAssignment
//
//  Created by Khalid hassan on 8/19/22.
//

import Foundation

struct Coordinates: Codable{
   
    private var longitude: String?
    private var latitude: String?
   
   func getCitylongitude() -> String?{
       
       self.longitude
       
   }
   
   mutating func setCitylongitude(longitude: String?){
       
       self.longitude = longitude
   }
   
   func getCitylatitude() -> String?{
       
       self.latitude
       
   }
   
   mutating func setCitylatitude(latitude: String?){
       
       self.latitude = latitude
   }
   
   
   private enum CodingKeys: String, CodingKey{
       
       case longitude = "lon", latitude = "lat"
       
   }
   
}
