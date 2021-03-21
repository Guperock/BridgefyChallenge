//
//  BleProtocols.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 20/03/21.
//

import Foundation

protocol BleViewToPresenter: class {
    func initScan()
    func couldAddPeripheral(identifier: String) -> Bool
}

protocol BlePresenterToView: class {
    func hideScanIndicator()
}

protocol BlePresenterToInteractor: class {
    func initScan()
    func couldAddPeripheral(identifier: String) -> Bool
}

protocol BleInteractorToPresenter: class {
    func didScanFinish()
}

protocol BlePresenterToRouter: class {
    
}
