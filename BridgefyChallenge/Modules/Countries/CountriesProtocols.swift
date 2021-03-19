//
//  CountriesProtocols.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 18/03/21.
//

import Foundation

protocol CountriesViewToPresenter: class {
    func getAllCountries()
    func ungroupContries()
    func groupContries()
    func searchCountries(searchText: String?)
}

protocol CountriesPresenterToView: class {
    func showCountries(countriesGroups: [CountriesGroup])
}

protocol CountriesPresenterToInteractor: class {
    func retriveAllCountries()
    func ungroupContries()
    func groupContries()
    func searchCountries(searchText: String?)
    
}

protocol CountriesInteractorToPresenter: class {
    func updateCountries(countriesGroups: [CountriesGroup])
}

protocol CountriesPresenterToRouter: class {
    
}


