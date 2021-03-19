//
//  CountriesEntity.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 18/03/21.
//

import Foundation

struct BasicCountry: Codable {
    let name: String
    let alpha2Code: String
    let alpha3Code: String
    let region: String
}

class CountriesGroup {
    let region: String?
    var countries: [BasicCountry]
    
    init(region: String?, countries: [BasicCountry]) {
        self.region = region
        self.countries = countries
    }
}
