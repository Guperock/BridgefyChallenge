//
//  UnderLineTextField.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 16/03/21.
//

import UIKit

class UnderLineTextField: UITextField {
    
    init() {
        super.init(frame: .zero)
        self.addUnderlineAndLeadingSpace()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addUnderlineAndLeadingSpace()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.addUnderlineAndLeadingSpace()
    }
    
    private func addUnderlineAndLeadingSpace() {
        let vUnderline = UIView()
        vUnderline.translatesAutoresizingMaskIntoConstraints = false
        vUnderline.heightAnchor.constraint(equalToConstant: 1).isActive = true
        vUnderline.backgroundColor = UIColor.lightGray.withAlphaComponent(0.6)
        self.addSubview(vUnderline)
        vUnderline.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        vUnderline.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        vUnderline.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        let vLeadingSpace = UIView()
        vLeadingSpace.translatesAutoresizingMaskIntoConstraints = false
        vLeadingSpace.widthAnchor.constraint(equalToConstant: 16).isActive = true
        self.leftView = vLeadingSpace
        self.leftViewMode = .always
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
