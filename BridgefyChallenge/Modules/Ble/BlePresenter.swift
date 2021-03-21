//
//  BlePresenter.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 20/03/21.
//

import Foundation

class BlePresenter {
    
    var view: BlePresenterToView?
    var interactor: BlePresenterToInteractor?
    var router: BlePresenterToRouter?
}

extension BlePresenter: BleViewToPresenter {
    func initScan() {
        self.interactor?.initScan()
    }
    
    func couldAddPeripheral(identifier: String) -> Bool {
        return self.interactor?.couldAddPeripheral(identifier: identifier) ?? true
    }
}

extension BlePresenter: BleInteractorToPresenter {
    
    func didScanFinish() {
        self.view?.hideScanIndicator()
    }
    
}
