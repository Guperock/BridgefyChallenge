//
//  CountriesInteractor.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 18/03/21.
//

import Foundation

class CountriesInteractor {
    var presenter: CountriesInteractorToPresenter?
    let service = GenericBasicService()
    
    private var allCountries: [BasicCountry] = [] {
        didSet {
            self.presenter?.updateCountries(countriesGroups: [CountriesGroup(region: nil, countries: allCountries)])
        }
    }
    
}

extension CountriesInteractor: CountriesPresenterToInteractor {
    
    func retriveAllCountries() {
        //Get countries list from service
        self.service.get(url: service.basicURL + "all", expectedResponse: [BasicCountry].self) { [weak self] (result) in
            switch result {
            case .success(let allCountries):
                self?.allCountries = allCountries.sorted(by: {$0.name < $1.name })
            case .failure(let error):
                self?.presenter?.didRetriveCountriesFails(message: error.errorDescription)
            }
        }
    }
    
    func groupContries() {
        //Create group from all countries
        var countriesGroups: [CountriesGroup] = []
        for country in self.allCountries {
            if let countryGroup = countriesGroups.first(where: {$0.region == country.region}) {
                countryGroup.countries.append(country)
            }else {
                let countryGroup = CountriesGroup(region: country.region , countries: [country])
                countriesGroups.append(countryGroup)
            }
        }
        
        self.presenter?.updateCountries(countriesGroups: countriesGroups)
    }
    
    func ungroupContries() {
        //Return one group with all countries
        self.presenter?.updateCountries(countriesGroups: [CountriesGroup(region: nil, countries: self.allCountries)])
    }
    
    func searchCountries(searchText: String?) {
        //Get all countries that contains the search text in your name, alpha2code or alpha3code
        if let searchText = searchText?.uppercased(), !searchText.isEmpty{
            let countriesFiltered = self.allCountries.filter({$0.name.uppercased().contains(searchText) || $0.alpha2Code.contains(searchText) || $0.alpha3Code.contains(searchText)})
            self.presenter?.updateCountries(countriesGroups: [CountriesGroup(region: nil, countries: countriesFiltered)])
        }else {
            presenter?.updateCountries(countriesGroups: [CountriesGroup(region: nil, countries: self.allCountries)])
        }
    }
    
}
