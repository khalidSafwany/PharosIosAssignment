//
//  ViewController.swift
//  PharosIosAssignment
//
//  Created by Khalid hassan on 8/19/22.
//

import UIKit

class CitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching {
    
    
    
    private var citiesViewModel: CitiesViewModel?
    
    private var citiesList = [City]()
    
    func getCitiesViewMode() -> CitiesViewModel?{
        return citiesViewModel ?? CitiesViewModel()
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
        self.title = "Cities"
        setCitiesSearchBarConstraints()
        setCitiesTableViewConstraints()
        citiesTableView.delegate = self
        citiesTableView.dataSource = self
        citiesTableView.prefetchDataSource = self
        citiesSearchBar.delegate = self
        setUpViewModel()
        DispatchQueue.global().async() {
            self.citiesViewModel?.getCities()
        }
        
        
    }

    private func setUpViewModel(){
        citiesViewModel = CitiesViewModel()
        citiesViewModel?.bindViewModelSuccessToView = {

            self.onSuccessUpdateView()

        }

        citiesViewModel?.bindViewModelErrorToView = {

            self.onFailUpdateView()

        }
        
        

//        citiesViewModel.bindPreviousSearchTextToView = {
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
    }
    
    
    private func onSuccessUpdateView(){
        citiesList = (citiesViewModel?.getCurrentCitiesList())!
        DispatchQueue.main.async { [weak self] in
            self?.citiesTableView.reloadData()

        }
        
    }
    
    
    func onFailUpdateView(){
        let alert = UIAlertController(title: "Error", message: citiesViewModel?.showError, preferredStyle: .alert)
        
        let okAction  = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
            
            
        }
        
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
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
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        citiesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cityCell = citiesTableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as?
            CitiesTableViewCell
        
        
        cityCell?.setMyDate(cellCity: citiesList[indexPath.row])
        
        return cityCell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.2
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if citiesSearchBar.text == ""{
        if indexPaths.last?.row ?? 0 > (citiesList.count - 2){
            citiesViewModel?.getCities()
        }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mapViewController = CItyMapViewController() // OR use storyboard.instantiate
        mapViewController.setSelectedCity(citiesList[indexPath.row])

        self.navigationController?.pushViewController(mapViewController, animated: true)
            }
    }


