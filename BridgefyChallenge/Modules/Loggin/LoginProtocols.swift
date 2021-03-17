//
//  LoginProtocols.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 16/03/21.
//

import Foundation

protocol LoginViewToPresenter {
    func makeLogin(email: String, password: String)
}

protocol LoginPresenterToView {
    func showFailsMessage(description: String)
}

protocol LoginPresenterToInteractor {
    func validateCredentials(email: String, password: String)
}

protocol LoginInteractorToPresenter {
    func didValidationSuccess()
    func didValidationFails(description: String)
    
}

protocol LoginPresenterToRouter {
    func goToDashboard()
}
