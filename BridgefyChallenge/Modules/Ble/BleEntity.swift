//
//  BleEntity.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 20/03/21.
//

import Foundation

struct Device {
    let name: String
    let properties: [String]
    let rssi: String
    
    init(name: String, properties: [String], rssi: String) {
        self.name = name
        self.properties = properties
        self.rssi = rssi
    }
}
