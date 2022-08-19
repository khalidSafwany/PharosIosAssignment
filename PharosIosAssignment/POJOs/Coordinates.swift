//
//  Coordinates.swift
//  PharosIosAssignment
//
//  Created by Khalid hassan on 8/19/22.
//

import Foundation

struct Coordinates: Codable{
   
    private var longitude: Float?
    private var latitude: Float?
   
   func getCitylongitude() -> Float?{
       
       self.longitude
       
   }
   
   mutating func setCitylongitude(longitude: Float?){
       
       self.longitude = longitude
   }
   
   func getCitylatitude() -> Float?{
       
       self.latitude
       
   }
   
   mutating func setCitylatitude(latitude: Float?){
       
       self.latitude = latitude
   }
   
   
   private enum CodingKeys: String, CodingKey{
       
       case longitude = "lon", latitude = "lat"
       
   }
   
}
