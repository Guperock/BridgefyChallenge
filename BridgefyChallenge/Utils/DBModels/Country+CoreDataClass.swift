//
//  Country+CoreDataClass.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 20/03/21.
//
//

import Foundation
import CoreData

@objc(Country)
public class Country: NSManagedObject {
    
    static let entityName = "Country"
    
    @discardableResult
    func save(countryDetail: CountryDetail , alpha2Code: String) -> Bool{
        guard let newCountry = NSEntityDescription.insertNewObject(forEntityName: Country.entityName, into: DBManager.shared.context) as? Country else {
            return false
        }
        newCountry.alpha2Code = alpha2Code
        newCountry.alpha3Code = countryDetail.alpha3Code
        newCountry.area = countryDetail.area ?? 0
        newCountry.borders = countryDetail.borders
        newCountry.callingCodes = countryDetail.callingCodes
        newCountry.capital = countryDetail.capital
        newCountry.currencies = countryDetail.currencies
        newCountry.languages = countryDetail.languages
        newCountry.latlng = countryDetail.latlng
        newCountry.name = countryDetail.name
        newCountry.population = Int64(countryDetail.population)
        newCountry.subregion = countryDetail.subregion
        newCountry.timezones = countryDetail.timezones
        return true
    }
    
    @discardableResult
    func retrive(alpha2Code: String) -> Country? {
        let predicate = NSPredicate(format: "alpha2Code == %@", alpha2Code)
        return get(withPredicate: predicate).first
    }
    
    @discardableResult
    func delete(alpha2Code: String) -> Bool {
        guard let country = retrive(alpha2Code: alpha2Code) else {
            return false
        }
        DBManager.shared.context.delete(country)
        return true
    }
    
    private func get(withPredicate predicate: NSPredicate) -> [Country] {
        var result: [Country] = []
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Country.entityName)
        fetchRequest.predicate = predicate
        fetchRequest.returnsObjectsAsFaults = false
        do {
            if let conutryArray = try DBManager.shared.context.fetch(fetchRequest) as? [Country] {
                result = conutryArray
            }
            
        }catch (let error){
            print(">>>>> Error to make query in \(Country.entityName): " + error.localizedDescription)
        }
        return result
    }

}
