//
//  FileManger.swift
//  PharosIosAssignment
//
//  Created by Khalid hassan on 8/21/22.
//

import Foundation

import UIKit


class CitiesFileManager {
    
    static let shared = CitiesFileManager()
    var cities : [City]?
    
    struct  CachedCitiesData : Codable{
        let cities : [City]
    }

    private func documentDirectoryPath() -> URL? {
        let path = FileManager.default.urls(for: .documentDirectory,
                                            in: .userDomainMask)
        print("path : \(String(describing: path.first))")
        return path.first
    }
    
    func cacheProducts(with citiesArray : [City]) {
        do {
            let filePath = documentDirectoryPath()?.appendingPathComponent(URLs.getPresistentFilePath())
            let cachedProductsData = CachedCitiesData(cities: citiesArray)
            let data = try JSONEncoder().encode(cachedProductsData)
            if let productsFilePath = filePath {
                try data.write(to: productsFilePath , options: .atomicWrite)
                
            }
            
        }catch let error {
            print("error caching products\(error.localizedDescription)")
        }
        JSONEncoder().dataEncodingStrategy = .base64
        
    }
    
    func readCachedCities() -> [City]? {
        do{
            if let filePath = documentDirectoryPath()?.appendingPathComponent(URLs.getPresistentFilePath()){
            if let data = try? Data(contentsOf: filePath){
                JSONDecoder().dataDecodingStrategy = .base64
                let cachedProductsData = try JSONDecoder().decode(CachedCitiesData.self, from: data)
                self.cities = cachedProductsData.cities
            }
        }
        }catch let error {
            print("error reading cached products\(error.localizedDescription)")
        }
        return cities
    }
    
    
    
}
