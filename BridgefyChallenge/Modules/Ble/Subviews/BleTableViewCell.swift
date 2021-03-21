//
//  BleTableViewCell.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 20/03/21.
//

import UIKit

class BleTableViewCell: UITableViewCell {
    
    private let lblDeviceName = UILabel()
    private let lblDeviceProperties = UILabel()
    private let lblRssi = UILabel()

    static let idCell = "BleTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        buildUI()
    }
    
    private func buildUI() {
        
        selectionStyle = .none
        
        let stvMain = UIStackView()
        stvMain.axis = .vertical
        stvMain.alignment = .fill
        stvMain.distribution = .fill
        
        lblDeviceName.font = .boldSystemFont(ofSize: 16)
        lblDeviceName.textAlignment = .left
        lblDeviceProperties.font = .systemFont(ofSize: 14)
        lblDeviceProperties.textColor = .lightGray
        lblDeviceProperties.numberOfLines = 0
        lblDeviceProperties.textAlignment = .left
        lblRssi.font = .systemFont(ofSize: 14)
        lblRssi.textColor = .lightGray
        lblRssi.textAlignment = .left
        
        stvMain.addArrangedSubview(lblDeviceName)
        stvMain.addArrangedSubview(lblDeviceProperties)
        stvMain.addArrangedSubview(lblRssi)
        
        stvMain.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stvMain)
        stvMain.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        stvMain.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        stvMain.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        stvMain.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
        let vUnderline = UIView()
        vUnderline.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        vUnderline.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(vUnderline)
        vUnderline.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        vUnderline.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        vUnderline.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        vUnderline.heightAnchor.constraint(equalToConstant: 1.5).isActive = true
    }
    
    func setupCell(device: Device) {
        self.lblDeviceName.text = device.name
        addProperties(properties: device.properties)
        self.lblRssi.text = "rssi: " + device.rssi
    }
    
    private func addProperties(properties: [String]) {
        var text = ""
        for property in properties {
            text += property
            
            if property != properties.last {
                text += "\n"
            }
        }
        
        self.lblDeviceProperties.text = text
        
    }

}
