//
//  Country+CoreDataProperties.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 20/03/21.
//
//

import Foundation
import CoreData


extension Country {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country> {
        return NSFetchRequest<Country>(entityName: "Country")
    }

    @NSManaged public var alpha2Code: String
    @NSManaged public var alpha3Code: String
    @NSManaged public var area: Double
    @NSManaged public var borders: [String]
    @NSManaged public var callingCodes: [String]
    @NSManaged public var capital: String
    @NSManaged public var currencies: [String]
    @NSManaged public var languages: [String]
    @NSManaged public var latlng: [Double]
    @NSManaged public var name: String
    @NSManaged public var population: Int64
    @NSManaged public var subregion: String
    @NSManaged public var timezones: [String]

}
