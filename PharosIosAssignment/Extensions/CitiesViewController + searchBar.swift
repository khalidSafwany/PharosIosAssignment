//
//  CitiesViewController + searchBar.swift
//  PharosIosAssignment
//
//  Created by Khalid hassan on 8/21/22.
//

import Foundation
import UIKit

extension CitiesViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.reload(_:)), object: searchBar)
        perform(#selector(self.reload(_:)), with: searchBar, afterDelay: 0.75)
    }

    @objc func reload(_ searchBar: UISearchBar) {
        guard searchBar.text != nil else {
            print("nothing to search")
            return
        }
        
        updateSearchText(searchText: searchBar.text ?? "")
       
    }
    
    
    func updateSearchText(searchText: String){
        
        
        self.getCitiesViewMode()?.filterCities(searchWord: searchText)
    }
    
}
