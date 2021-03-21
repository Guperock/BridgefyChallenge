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
    
    ///Singleton to use DB functions
    static let shared = DBManager()
    
    var context: NSManagedObjectContext {
        get{
            return persistanceContainer.viewContext
        }
    }
    
    private init(){ }
    
    ///Return TRUE if country detail has been saved o FALSE if error happend or the country exist in the DB previously
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
    
    ///Return TRUE if country detail has been deleted from DB o FALSE if error happend
    func removeCountryDetail(countryAlpha2Code: String) -> Bool {
        guard let entity = NSEntityDescription.entity(forEntityName: Country.entityName, in: self.context) else {
            return false
        }
        
        let countryDB = Country(entity: entity, insertInto: nil)
        return countryDB.delete(alpha2Code: countryAlpha2Code)
    }
    
    ///Return country detail if exist in DB
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
