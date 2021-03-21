//
//  DBManager.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 20/03/21.
//

import Foundation
import CoreData

class DBManager {
    
    private lazy var persistanceContainer: NSPersistentContainer = {
       let container =  NSPersistentContainer(name: "BridgefyChallenge")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                print(">>>>> Error to load perisistance in: " + storeDescription.description + ", " + error.localizedDescription )
            }
        }
        return container
    }()
    
    static let shared = DBManager()
    
    var context: NSManagedObjectContext {
        get{
            return persistanceContainer.viewContext
        }
    }
    
    private init(){ }
    
    /*
    func getContext() -> NSManagedObjectContext {
        return persistanceContainer.viewContext
    }
 */
    
    func storeCountryDetail(countryDetail: CountryDetail, alpha2Code: String) -> Bool {
        guard let entity = NSEntityDescription.entity(forEntityName: Country.entityName, in: self.context) else {
            return false
        }
        
        let countryDB = Country(entity: entity, insertInto: nil)
        if let _ = countryDB.retrive(alpha2Code: alpha2Code) {
            return false
        }
        
        return countryDB.save(countryDetail: countryDetail, alpha2Code: alpha2Code)
    }
    
    func removeCountryDetail(countryAlpha2Code: String) -> Bool {
        guard let entity = NSEntityDescription.entity(forEntityName: Country.entityName, in: self.context) else {
            return false
        }
        
        let countryDB = Country(entity: entity, insertInto: nil)
        return countryDB.delete(alpha2Code: countryAlpha2Code)
    }
    
    func getCountryDetal(alpha2Code: String) -> CountryDetail? {
        
        guard let entity = NSEntityDescription.entity(forEntityName: Country.entityName, in: self.context) else {
            return nil
        }
        
        let countryDB = Country(entity: entity, insertInto: nil)
        guard let country = countryDB.retrive(alpha2Code: alpha2Code) else {
            return nil
        }
        
        return CountryDetail(name: country.name,
                             alpha3Code: country.alpha3Code,
                             capital: country.capital,
                             subregion: country.subregion,
                             area: country.area,
                             latlng: country.latlng,
                             population: Int(country.population),
                             languages: country.languages,
                             callingCodes: country.callingCodes,
                             timezones: country.timezones,
                             currencies: country.currencies,
                             borders: country.borders)
    }
    
    
}
