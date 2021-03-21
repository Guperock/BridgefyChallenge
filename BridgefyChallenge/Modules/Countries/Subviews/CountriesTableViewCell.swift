//
//  CountriesTableViewCell.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 18/03/21.
//

import UIKit

class CountriesTableViewCell: UITableViewCell {
    
    static let idCell = "CountriesTableViewCell"
    
    @IBOutlet weak var lblCountryName: UILabel!
    @IBOutlet weak var lblCountryCodes: UILabel!
    @IBOutlet weak var lblEmojiFlag: UILabel!
    
  
    func setupCell(withCountry country: BasicCountry) {
        self.lblCountryName.text = country.name
        self.lblCountryCodes.text = "\(country.alpha2Code)/\(country.alpha3Code)"
        self.lblEmojiFlag.text = getEmojiFlag(code: country.alpha2Code)
    }
    
    private func getEmojiFlag(code: String) -> String {
        let base = 127397
        var usv = String.UnicodeScalarView()
        for i in code.utf16 {
            usv.append(UnicodeScalar(base + Int(i))!)
        }
        return String(usv)
    }
    
}
