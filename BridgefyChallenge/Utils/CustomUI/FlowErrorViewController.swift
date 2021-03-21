//
//  FlowErrorViewController.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 20/03/21.
//

import UIKit

protocol FlowErrorViewControllerDelegate: class {
    func didFinishError()
}

class FlowErrorViewController: UIViewController {
    
    let lblMessage = UILabel()
    
    private var delegate: FlowErrorViewControllerDelegate?

    init(message: String, delegate: FlowErrorViewControllerDelegate? ) {
        super.init(nibName: nil, bundle: nil)
        self.lblMessage.text = message
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        lblMessage.text = " Sorry something went wrong."
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.buildUI()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        delegate?.didFinishError()
    }
    
    private func buildUI() {
        
        self.view.backgroundColor = .white
        
        let imvIcon = UIImageView()
        imvIcon.image = UIImage(named: "warning_icon")
        imvIcon.contentMode = .scaleAspectFit
        imvIcon.tintColor = .getAssentColor()
        
        self.view.addSubview(imvIcon)
        imvIcon.translatesAutoresizingMaskIntoConstraints = false
        imvIcon.lastBaselineAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        imvIcon.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.lblMessage.textColor = .lightGray
        self.lblMessage.font = .boldSystemFont(ofSize: 22)
        self.lblMessage.textAlignment = .center
        self.lblMessage.numberOfLines = 0
        
        self.view.addSubview(self.lblMessage)
        self.lblMessage.translatesAutoresizingMaskIntoConstraints = false
        self.lblMessage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
        self.lblMessage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24).isActive = true
        self.lblMessage.topAnchor.constraint(equalTo: imvIcon.bottomAnchor, constant: 20).isActive = true
        
        let btnAccept = UIButton()
        btnAccept.setTitle("Accept", for: .normal)
        btnAccept.setTitleColor(.white, for: .normal)
        btnAccept.backgroundColor = .getAssentColor()
        btnAccept.layer.cornerRadius = 8
        btnAccept.addTarget(self, action: #selector(onClickAccept), for: .touchUpInside)
        
        self.view.addSubview(btnAccept)
        btnAccept.translatesAutoresizingMaskIntoConstraints = false
        btnAccept.topAnchor.constraint(greaterThanOrEqualTo: self.lblMessage.bottomAnchor, constant: 20).isActive = true
        btnAccept.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
        btnAccept.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24).isActive = true
        btnAccept.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -24).isActive = true
        btnAccept.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
    }
    @objc private func onClickAccept(){
        self.dismiss(animated: true, completion: nil)
    }
    
}
