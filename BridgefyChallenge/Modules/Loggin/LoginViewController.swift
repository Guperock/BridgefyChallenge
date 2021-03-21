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
    @IBOutlet weak var actIndicator: UIActivityIndicatorView!
    
    var presenter: LoginViewToPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnLogin.layer.cornerRadius = 8
        self.txfEmail.delegate = self
    }

    @IBAction func onLoginClicked(_ sender: Any) {
        
        guard let email = self.txfEmail.text,
              !email.isEmpty  else {
            self.showAlert(message: "You must enter email field")
            return
        }
        
        guard email.contains("@") && email.contains(".") else {
            self.showAlert(message: "This email dont is valid. ")
            return
        }
        
        guard let password = self.txfPassword.text,
              !password.isEmpty else {
            
            self.showAlert(message: "You must enter password field")
            return
        }
        
        self.btnLogin.setTitle(nil, for: .normal)
        self.actIndicator.startAnimating()
        self.btnLogin.isEnabled = false
        self.presenter?.makeLogin(email: email, password: password)
    }
    
    private func showAlert(message: String) {
        let alertVC = UIAlertController(title: "Warning", message: message, preferredStyle: .actionSheet)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }

}

extension LoginViewController: LoginPresenterToView {
    func showFailsMessage(description: String) {
        self.btnLogin.setTitle("Login", for: .normal)
        self.actIndicator.stopAnimating()
        self.btnLogin.isEnabled = true
        self.showAlert(message: description)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let email = textField.text, !email.isEmpty else {
            return
        }
        
        if !email.contains("@") || !email.contains(".") {
            self.showAlert(message: "This email dont is valid. ")
        }
    }
}
