//
//  AppDelegate.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 16/03/21.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        IQKeyboardManager.shared.enable = true
        let vc = LoginRouter.createLogin()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }


}

