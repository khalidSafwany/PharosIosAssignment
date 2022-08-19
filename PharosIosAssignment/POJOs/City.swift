//
//  City.swift
//  PharosIosAssignment
//
//  Created by Khalid hassan on 8/19/22.
//

import Foundation


struct City: Codable{
    
     private var countrySymbols: String?
     private var cityName: String?
     private var cityId: Int?
     private var cityCooridnates: Coordinates?
    
    private enum CodingKeys: String, CodingKey{
        
        case countrySymbols = "counrty",cityName = "name",cityId = "_id",cityCooridnates = "coord"
        
    }
    
    
    func getCountrySymbols() -> String?{
        
        self.countrySymbols
        
    }
    
    mutating func setCountrySymbols(countrySymbols: String?){
        
        self.countrySymbols = countrySymbols
    }
    
    func getCityName() -> String?{
        
        self.cityName
        
    }
    
    mutating func setCityName(cityName: String?){
        
        self.cityName = cityName
    }
    
    func getCityId() -> Int?{
        
        self.cityId
        
    }
    
    mutating func setCityId(cityId: Int?){
        
        self.cityId = cityId
    }
    
    func getCityCoordinates() -> Coordinates?{
        
        self.cityCooridnates
        
    }
    
    mutating func setCountryCoordinates(cityCooridnates: Coordinates?){
        
        self.cityCooridnates = cityCooridnates
    }
    
    
  
    
}



