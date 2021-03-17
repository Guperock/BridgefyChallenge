//
//  LogginViewController.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 16/03/21.
//

import UIKit


class LoginViewController: UIViewController {
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txfEmail: UnderLineTextField!
    @IBOutlet weak var txfPassword: UnderLineTextField!
    
    var presenter: LoginViewToPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnLogin.layer.cornerRadius = 8
    }

    @IBAction func onLoginClicked(_ sender: Any) {
        guard let email = self.txfEmail.text,
              !email.isEmpty,
              let password = self.txfPassword.text,
              !password.isEmpty else {
            
            self.showAlert(message: "Debe ingrasar ambos campos")
            return
        }
        
        self.presenter?.makeLogin(email: email, password: password)
    }
    
    private func showAlert(message: String) {
        let alertVC = UIAlertController(title: "Aviso", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }

}

extension LoginViewController: LoginPresenterToView {
    func showFailsMessage(description: String) {
        self.showAlert(message: description)
    }
}
