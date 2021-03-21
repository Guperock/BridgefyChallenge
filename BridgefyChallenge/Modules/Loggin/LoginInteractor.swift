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
        
        let timeRandom = Double.random(in: 2...20)/10
        
        Timer.scheduledTimer(withTimeInterval: timeRandom, repeats: false) { (_) in
            
            guard email.elementsEqual("challenge@bridgefy.me") else {
                self.presenter?.didValidationFails(description: "The email dont is registered.")
                return
            }
            
            guard password.elementsEqual("P@$$w0rD!") else {
                self.presenter?.didValidationFails(description: "Password invalid.")
                return
            }
            
            self.presenter?.didValidationSuccess()
        }
        
    }
}
