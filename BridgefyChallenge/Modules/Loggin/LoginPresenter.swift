//
//  LoginPresenter.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 16/03/21.
//

import Foundation

class LoginPresenter {
    
    var view: LoginPresenterToView?
    var interactor: LoginPresenterToInteractor?
    var router: LoginPresenterToRouter?
    
    
}

extension LoginPresenter: LoginViewToPresenter {
    func makeLogin(email: String, password: String) {
        self.interactor?.validateCredentials(email: email, password: password)
    }
}

extension LoginPresenter: LoginInteractorToPresenter {
    func didValidationSuccess() {
        self.router?.goToDashboard()
    }
    
    func didValidationFails(description: String) {
        self.view?.showFailsMessage(description: description)
    }
}
