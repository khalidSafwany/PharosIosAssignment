//
//  URL.swift
//  PharosIosAssignment
//
//  Created by Khalid hassan on 8/20/22.
//

import Foundation

struct URLs {
    private static var citiesUrl = "http://assignment.pharos-solutions.de/cities.json?page="
    private static let presistentFilePath = "CachedDataFile.json"
    
    
    static func getCitiesUrl(_ pageNumber:Int) -> String{
        let urlString = "\(citiesUrl)\(String(pageNumber))"
        
        return urlString
        
    }
    
    static func getStaticMapImageURLSring(for cityName: String) -> String{
        
        let url = "https://maps.googleapis.com/maps/api/staticmap?center=\(cityName),CA&zoom=14&size=400x400&key=\(Credentials.getAPIKey())"
        return url
        
    }
    
    static func getPresistentFilePath() -> String{
        presistentFilePath
    }
}
