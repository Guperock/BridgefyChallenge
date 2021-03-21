//
//  UILabelExtensions.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 20/03/21.
//

import Foundation
import UIKit.UILabel

extension UILabel {
    
    ///Return the namount seoarated with ( , )
    func decimalFormatter(stringToApplyFormat: Int ){
        let NSFormater = NumberFormatter()
        NSFormater.numberStyle = .decimal
        self.text = NSFormater.string( from: NSNumber(value: stringToApplyFormat))!
    }
    
}
