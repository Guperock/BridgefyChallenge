//
//  BleInteractor.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 20/03/21.
//

import Foundation
import CoreBluetooth
import UIKit

class BleInteractor {
    
    private var peripheralsFetched: [String] = []
    
    var presenter: BleInteractorToPresenter?
    
    private func initTimer() {
        Timer.scheduledTimer(withTimeInterval: 30, repeats: false) { (_) in
            self.presenter?.didScanFinish()
        }
    }
    
}

extension BleInteractor: BlePresenterToInteractor {
    
    func initScan() {
        peripheralsFetched.removeAll()
        initTimer()
    }
    
    func couldAddPeripheral(identifier: String) -> Bool {
        
        //Validate if periphera has been added
        guard !self.peripheralsFetched.contains(where: {$0 == identifier}) else {
            return false
        }
        
        self.peripheralsFetched.append(identifier)
        return true
        
    }
    
}
