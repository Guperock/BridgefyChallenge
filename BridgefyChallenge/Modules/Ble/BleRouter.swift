//
//  BleRouter.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 20/03/21.
//

import Foundation
import UIKit.UIViewController

class BleRouter {
    
    var view: UIViewController?
    
    static func createBleMoudule() -> UIViewController{
        let view = BleViewController(nibName: "BleViewController", bundle: .main)
        let presenter = BlePresenter()
        let interactor = BleInteractor()
        let router = BleRouter()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.view = view
        return view
    }
}

extension BleRouter: BlePresenterToRouter {
    
}
