//
//  CountryDetailViewController.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 19/03/21.
//

import UIKit

class CountryDetailViewController: UIViewController {
    
    @IBOutlet weak var imvFlag: IndicatorImageView!
    @IBOutlet weak var lblCountryName: UILabel!
    @IBOutlet weak var lblCapital: UILabel!
    @IBOutlet weak var imvMap: UIImageView!
    @IBOutlet weak var lblContinent: UILabel!
    @IBOutlet weak var lblTerritorialExpansion: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblPopulation: UILabel!
    @IBOutlet weak var lblLanguage: UILabel!
    @IBOutlet weak var lblPhoneCode: UILabel!
    @IBOutlet weak var stvTimeZones: UIStackView!
    @IBOutlet weak var lblCurrency: UILabel!
    @IBOutlet weak var cltBorders: BordersCollectionView!
    @IBOutlet weak var cnsCollectionWidth: NSLayoutConstraint!
    @IBOutlet weak var vBorders: FloatinView!
    @IBOutlet weak var vTimezones: FloatinView!
    
    var presenter: CountryDetailViewToPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cltBorders.cnsWidth = self.cnsCollectionWidth
        self.presenter?.getCountryDetail()
        
        // Remove this if when add back icon to assets
        if #available(iOS 13.0, *) {
            self.navigationItem.setLeftBarButton(UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(onClickBack)), animated: true)
            self.navigationItem.leftBarButtonItem?.tintColor = .getAssentColor()
        }
    }
    
    ///Func to insert timezones into the stackview or hide if array is empty
    private func addTimezones(timezones: [String]) {
        
        guard !timezones.isEmpty else {
            self.vTimezones.isHidden = true
            return
        }
        
        var fontSize = 20
        
        switch timezones.count {
        case 1...6:
            fontSize = 20
        case 7,8:
            fontSize = 16
        default:
            fontSize = 12
        }
        
        for timezone in timezones {
            let lblTimezone = UILabel()
            lblTimezone.text = timezone.trimmingCharacters(in: .letters)
            lblTimezone.font = .systemFont(ofSize: CGFloat(fontSize))
            lblTimezone.textColor = .lightGray
            lblTimezone.textAlignment = .center
            self.stvTimeZones.addArrangedSubview(lblTimezone)
        }
    }
    
    private func showAlertDialog(message: String) {
        let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }

    @objc private func onClickBack(){
        self.presenter?.getOutFromDetail()
    }
    
    @objc private func onSaveClicked() {
        self.presenter?.saveCountryDetail()
    }
    
    @objc private func onDeleteClicked() {
        self.presenter?.deleteCountryDetail()
    }
    
}

extension CountryDetailViewController: CountryDetailPresenterToView {
    func setCountryDetail(countryDetail: CountryDetail, isLocalData: Bool) {
        // Here set all info to UI
        if let image = UIImage(named: countryDetail.alpha3Code) {
            self.imvMap.image = image
        }
        
        self.lblCountryName.text = countryDetail.name
        self.title = countryDetail.name
        self.lblCapital.text = countryDetail.capital
        self.lblPopulation.decimalFormatter(stringToApplyFormat: countryDetail.population)
        self.lblContinent.text = countryDetail.subregion
        self.lblTerritorialExpansion.decimalFormatter(stringToApplyFormat: Int(countryDetail.area ?? 0))
        self.lblTerritorialExpansion.text?.append(" km2")
        if let territoriaText = self.lblTerritorialExpansion.text {
            let attString = NSMutableAttributedString(string: territoriaText)
            attString.setAttributes([.font:UIFont.systemFont(ofSize: 11),.baselineOffset:10], range: NSRange(location:territoriaText.count - 1,length:1))
            self.lblTerritorialExpansion.attributedText = attString
        }
        
        if countryDetail.latlng.count > 1 {
            let lat = round(countryDetail.latlng[0] * 10)/10
            let lng = round(countryDetail.latlng[1] * 10)/10
            self.lblLocation.text = "(\(lat), \(lng))"
        }
        
        self.lblPhoneCode.text = countryDetail.callingCodes.first
        
        if let languageCode = countryDetail.languages.first {
            let fullLanguageName = Locale(identifier: "en_US").localizedString(forLanguageCode: languageCode)
            self.lblLanguage.text = fullLanguageName
        }
        
        if let currencyCode = countryDetail.currencies.first {
            let fullCurrencyName = Locale(identifier: "en_US").localizedString(forCurrencyCode: currencyCode)
            self.lblCurrency.text = fullCurrencyName
        }
        
        if countryDetail.borders.isEmpty {
            self.vBorders.isHidden = true
        }else {
            self.cltBorders.setBordersData(bordersData: countryDetail.borders)
        }
        
        
        self.addTimezones(timezones: countryDetail.timezones)
        
        //Request download image of flag
        self.presenter?.getFlagImage()
        
        if isLocalData {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(onDeleteClicked))
        }else {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(onSaveClicked))
        }
        
        self.navigationItem.rightBarButtonItem?.tintColor = .getAssentColor()
        
    }
    
    func showFlagImage(image: UIImage) {
        self.imvFlag.image = image
    }
    
    func didCountryDetailSaved() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(onDeleteClicked))
        self.navigationItem.rightBarButtonItem?.tintColor = .getAssentColor()
        self.showAlertDialog(message: "The country detail has been saved")
    }
    
    func didCountryDetailDeleted() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(onSaveClicked))
        self.navigationItem.rightBarButtonItem?.tintColor = .getAssentColor()
        self.showAlertDialog(message: "The country detail has been deleted")
    }
    
    func showErrorMessage(message: String) {
        let errorVC = FlowErrorViewController(message: message, delegate: self)
        self.present(errorVC, animated: true, completion: nil)
    }
    
}

extension CountryDetailViewController: FlowErrorViewControllerDelegate {
    func didFinishError() {
        self.presenter?.getOutFromDetail()
    }
}
