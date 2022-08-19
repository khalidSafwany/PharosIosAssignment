//
//  ViewController.swift
//  PharosIosAssignment
//
//  Created by Khalid hassan on 8/19/22.
//

import UIKit

class CitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cityCell = citiesTableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as?
            CitiesTableViewCell
        
        
        cityCell?.setMyDate()
        
        return cityCell!
    }
    
    
    
    
    var citiesTableView: UITableView = {
        let tableView:UITableView
        if #available(iOS 13.0, *) {
             tableView = UITableView(frame: CGRect.zero, style: .insetGrouped)
        } else {
            // Fallback on earlier versions
             tableView = UITableView(frame: CGRect.zero, style: .grouped)
        }
        tableView.separatorColor = UIColor.red
    
        tableView.backgroundColor = .white
        tableView.register(CitiesTableViewCell.self, forCellReuseIdentifier: "CityCell")
        tableView.tag = 100
        return tableView
    }()
    
    let citiesSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
            searchBar.searchBarStyle = UISearchBar.Style.default
            searchBar.placeholder = " Search..."
            searchBar.sizeToFit()
            searchBar.isTranslucent = false
            searchBar.backgroundImage = UIImage()
        
        return searchBar
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
      //  setUpViewModel()
        setCitiesSearchBarConstraints()
        setCitiesTableViewConstraints()
        citiesTableView.delegate = self
        citiesTableView.dataSource = self
        
    }

//    private func setUpViewModel(){
//        photosViewModel.bindPhotosViewModelToView = {
//
//            self.onSuccessUpdateView()
//
//        }
//
//        photosViewModel.bindViewModelErrorToView = {
//
//            self.onFailUpdateView()
//
//        }
//
//        photosViewModel.bindPreviousSearchTextToView = {
//            DispatchQueue.main.async {
//            if (self.photosSearchBar.text?.isEmpty ?? false){
//            self.showHistoryTableview()
//
//
//            self.searchHistoryTable.reloadData()
//
//            }
//            }
//        }
//    }
    
    
    
    private func setCitiesSearchBarConstraints(){
        
        view.addSubview(citiesSearchBar)
        citiesSearchBar.translatesAutoresizingMaskIntoConstraints = false
        citiesSearchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        if #available(iOS 11.0, *) {
            citiesSearchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            } else {
                citiesSearchBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
            }
        
        citiesSearchBar.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        citiesSearchBar.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05) .isActive = true
    }
    
    
    
    private func setCitiesTableViewConstraints(){
        
        view.addSubview(citiesTableView)
        
        citiesTableView.translatesAutoresizingMaskIntoConstraints = false
        citiesTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        citiesTableView.topAnchor.constraint(equalTo: citiesSearchBar.bottomAnchor).isActive = true
        citiesTableView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -16).isActive = true
        citiesTableView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.95).isActive = true
        
        
    }
}

