//
//  CountriesViewController.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 18/03/21.
//

import UIKit

class CountriesViewController: UIViewController {

    @IBOutlet weak var srcBar: UISearchBar!
    @IBOutlet weak var tblCountries: UITableView!
    
    private var countriesData: [CountriesGroup] = []
    private var isGroup = false
    
    var presenter: CountriesViewToPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Setup UI
        self.srcBar.delegate = self
        self.tblCountries.register(UINib(nibName: "CountriesTableViewCell", bundle: .main), forCellReuseIdentifier: CountriesTableViewCell.idCell)
        self.tblCountries.dataSource = self
        self.tblCountries.delegate = self
        self.presenter?.getAllCountries()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isGroup {
            addUngroupButton()
        }else{
            addGroupButton()
        }
    }
    
    private func addGroupButton() {
        self.parent?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Group", style: .plain, target: self, action: #selector(onGroupClicked))
        self.parent?.navigationItem.rightBarButtonItem?.tintColor = .getAssentColor()
    }
    
    private func addUngroupButton(){
        self.parent?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Ungroup", style: .plain, target: self, action: #selector(self.onUngroupClicked))
        self.parent?.navigationItem.rightBarButtonItem?.tintColor = .getAssentColor()
    }
    
    @objc private func onGroupClicked() {
        self.isGroup = true
        
        UIView.animate(withDuration: 0.1) {
            self.addUngroupButton()
            self.srcBar.text = ""
            self.srcBar.resignFirstResponder()
            self.srcBar.isHidden = true
        }
        
        self.presenter?.groupContries()
        
    }
    
    @objc private func onUngroupClicked() {
        
        self.isGroup = false
        
        UIView.animate(withDuration: 0.1) {
            self.addGroupButton()
            self.srcBar.isHidden = false
        }
        self.presenter?.ungroupContries()
    }

}

extension CountriesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return countriesData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countriesData[section].countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountriesTableViewCell.idCell, for: indexPath) as? CountriesTableViewCell else {
            return UITableViewCell()
        }
        
        let country = self.countriesData[indexPath.section].countries[indexPath.row]
        cell.setupCell(withCountry: country)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.countriesData[section].region
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let countryCode = self.countriesData[indexPath.section].countries[indexPath.row].alpha2Code
        self.presenter?.showDetail(countryCode: countryCode)
    }
}

extension CountriesViewController: CountriesPresenterToView {
    func showCountries(countriesGroups: [CountriesGroup]) {
        self.countriesData = countriesGroups
        self.tblCountries.reloadData()
    }
    
    func showErrorMessage(message: String) {
        let alertVC = UIAlertController(title: "Warning", message: message, preferredStyle: .actionSheet)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
}

extension CountriesViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        self.presenter?.searchCountries(searchText: searchBar.text)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.presenter?.searchCountries(searchText: searchBar.text)
    }
}
