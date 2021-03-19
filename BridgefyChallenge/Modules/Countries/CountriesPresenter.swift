//
//  CountriesPresenter.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 18/03/21.
//

import Foundation

class CountriesPresenter {
    var view: CountriesPresenterToView?
    var interactor: CountriesPresenterToInteractor?
    var router: CountriesPresenterToRouter?
}

extension CountriesPresenter: CountriesViewToPresenter {
    func getAllCountries() {
        self.interactor?.retriveAllCountries()
    }
    
    func groupContries() {
        self.interactor?.groupContries()
    }
    
    func ungroupContries() {
        self.interactor?.ungroupContries()
    }
    
    func searchCountries(searchText: String?) {
        self.interactor?.searchCountries(searchText: searchText)
    }
    
}

extension CountriesPresenter: CountriesInteractorToPresenter {
    func updateCountries(countriesGroups: [CountriesGroup]) {
        self.view?.showCountries(countriesGroups: countriesGroups)
    }

}
