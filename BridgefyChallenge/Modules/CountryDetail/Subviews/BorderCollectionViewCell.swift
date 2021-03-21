//
//  BorderCollectionViewCell.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 19/03/21.
//

import UIKit

class BorderCollectionViewCell: UICollectionViewCell {

    static let idCell = "BorderCollectionViewCell"
    
    @IBOutlet weak var lblCountryName: UILabel!
    @IBOutlet weak var lblFlag: UILabel!
    
    
    func setupCell(countryCode: String) {
        
        self.lblCountryName.text = Locale(identifier: "en_US").localizedString(forRegionCode: countryCode)
        self.lblFlag.text = IsoCountries.allCountries.first(where: {$0.alpha3 == countryCode})?.flag 
        
        
    
    }

}
