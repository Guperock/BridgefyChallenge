//
//  CountryDetailEntity.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 19/03/21.
//

import Foundation

struct CountryDetail: Codable {
    let name: String
    let alpha3Code: String
    let capital: String
    let subregion: String
    let area: Double?
    let latlng: [Double]
    let population: Int
    let languages: [String]
    let callingCodes: [String]
    let timezones: [String]
    let currencies: [String]
    let borders: [String]
    
}
