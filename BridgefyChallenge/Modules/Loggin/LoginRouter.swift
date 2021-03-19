//
//  LoginRouter.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 16/03/21.
//

import Foundation
import UIKit.UIViewController

public class LoginRouter {
    
    var view: LoginViewController
    
    private init(view: LoginViewController) {
        self.view = view
    }
    
    public static func createLogin() -> UIViewController {
        let view = LoginViewController(nibName: "LoginViewController", bundle: .main)
        let router = LoginRouter(view: view)
        let presenter = LoginPresenter()
        let interactor = LoginInteractor()
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
    }
}

extension LoginRouter: LoginPresenterToRouter {
    func goToDashboard() {
        let dashboard = TabContainerRouter.createTabContainer()
        dashboard.modalPresentationStyle = .overFullScreen
        self.view.present(dashboard, animated: true, completion: nil)
    }
}
