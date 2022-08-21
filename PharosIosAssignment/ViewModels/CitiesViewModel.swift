//
//  CitiesViewModel.swift
//  PharosIosAssignment
//
//  Created by Khalid hassan on 8/20/22.
//

import Foundation

class CitiesViewModel: NSObject {
    
    private var pageNumber: Int?
    private var fileManger: CitiesFileManager?
    private var mainCitiesList:[City]?
    private var citiesList:[City]?{
        
        didSet{
            
            self.pageNumber? += 1
            DispatchQueue.global().async {
                self.fileManger?.cacheProducts(with: self.citiesList ?? [City]())
            }
            
            self.bindViewModelSuccessToView()
        }
        
        
    }
    private var citiesService: CitiesService?
    
    var bindViewModelSuccessToView : (()->()) = {}
    var bindViewModelErrorToView : (()->()) = {}
    
    var showError : String! {
        
        didSet{
            
            self.bindViewModelErrorToView()
        }
        
    }
    
    override init() {
        super.init()
        mainCitiesList = [City]()
        pageNumber = 1
        citiesService = CitiesService()
        fileManger = CitiesFileManager()
    }
    
    func getCities(){
        var tempList = citiesList
        self.citiesService?.getCities(pageNumber: pageNumber ?? 1, completion: { [weak self] citiesList, error in
            if let error : Error = error{
                
                let message = error.localizedDescription
                self?.showError = message
                
            }else{
                if let _ = tempList {}else{
                    tempList = [City]()
                }
                
            for city in citiesList ?? [City](){
                tempList?.append(city)
                
            }
            
            self?.citiesList = tempList
            self?.mainCitiesList = tempList
            }
            
        
        })
        
        
        }
    
    
    func getCurrentCitiesList() -> [City]{
        
        return citiesList ?? [City]()
    }
    
    
    func filterCities(searchWord: String?){
        if let searchText = searchWord {
            if searchText.isEmpty{
                citiesList = mainCitiesList
            }
            else{
            citiesList = mainCitiesList?.filter({($0.getCityName()?.contains(searchText) ?? false)})
            }
        }else{
            citiesList = mainCitiesList
            
        }
        
    }
}
