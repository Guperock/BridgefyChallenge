//
//  TabContainerRouter.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 18/03/21.
//

import Foundation
import UIKit.UIViewController

class TabContainerRouter {
    
    static func createTabContainer() -> UIViewController {
        let firstView = CountriesRouter.createCountriesModule()
        let secondView = BleRouter.createBleMoudule()
        let view = TabContainerViewController(firstView: firstView, secondView: secondView)
        let navController = UINavigationController(rootViewController: view)
        return navController
    }
}
