//
//  BleViewController.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 20/03/21.
//

import UIKit
import CoreBluetooth

class BleViewController: UIViewController {

    @IBOutlet weak var tblDevices: UITableView!
    @IBOutlet weak var actIndicator: UIActivityIndicatorView!
    
    var presenter: BleViewToPresenter?
    
    private var devicesData: [Device] = []
    
    private var centralManager: CBCentralManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblDevices.register(BleTableViewCell.self, forCellReuseIdentifier: BleTableViewCell.idCell)
        self.tblDevices.dataSource = self
        self.centralManager = CBCentralManager(delegate: self, queue: nil)
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.parent?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Scan", style: .plain, target: self, action: #selector(onClickScan))
        self.parent?.navigationItem.rightBarButtonItem?.tintColor = .getAssentColor()
    }
    
    @objc private func onClickScan() {
        
        if !self.devicesData.isEmpty {
            self.devicesData.removeAll()
            self.tblDevices.reloadData()
        }
        
        
        self.actIndicator.startAnimating()
        if centralManager.state == .poweredOn {
            centralManager.scanForPeripherals(withServices: nil, options: nil)
            self.presenter?.initScan()
        }
       
    
    }
    
    private func addDevice(device: Device) {
        self.tblDevices.beginUpdates()
        self.devicesData.append(device)
        self.tblDevices.insertRows(at: [IndexPath(row: self.devicesData.count - 1, section: 0)], with: .automatic)
        self.tblDevices.endUpdates()
    }
    
}

extension BleViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devicesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BleTableViewCell.idCell, for: indexPath) as? BleTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setupCell(device: self.devicesData[indexPath.row])
        
        return cell
    }
    
}

extension BleViewController: BlePresenterToView {
    func hideScanIndicator() {
        self.actIndicator.stopAnimating()
        self.centralManager.stopScan()
    }
}

extension BleViewController: CBCentralManagerDelegate {
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        guard let presenter = self.presenter, presenter.couldAddPeripheral(identifier: peripheral.identifier.uuidString) else {
            return
        }
        
        var properties: [String] = []
        for data in advertisementData {
            properties.append("\(data.key): \(data.value)")
        }
        
        let device = Device(name: peripheral.name ?? "Unknow",
                            properties: properties,
                            rssi: "\(RSSI)")
        
        self.addDevice(device: device)
    }
    
}


