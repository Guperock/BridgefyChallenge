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
    func showDetail(countryCode: String)
}

protocol CountriesPresenterToView: class {
    func showCountries(countriesGroups: [CountriesGroup])
    func showErrorMessage(message: String)
}

protocol CountriesPresenterToInteractor: class {
    func retriveAllCountries()
    func ungroupContries()
    func groupContries()
    func searchCountries(searchText: String?)
    
}

protocol CountriesInteractorToPresenter: class {
    func updateCountries(countriesGroups: [CountriesGroup])
    func didRetriveCountriesFails(message: String)
}

protocol CountriesPresenterToRouter: class {
    func goToCountryDetail(countryCode: String)
}


