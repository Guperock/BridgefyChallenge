//
//  LoginInteractor.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 16/03/21.
//

import Foundation

class  LoginInteractor {
    
    var presenter: LoginInteractorToPresenter?
    
}

extension LoginInteractor: LoginPresenterToInteractor {
    func validateCredentials(email: String, password: String) {
        guard email.elementsEqual("challenge@bridgefy.me") else {
            self.presenter?.didValidationFails(description: "El correo no esta registrado")
            return
        }
        
        guard password.elementsEqual("P@$$w0rD!") else {
            self.presenter?.didValidationFails(description: "Contraseña incorrecta")
            return
        }
        
        self.presenter?.didValidationSuccess()
    }
}
