//
//  CountryDetailInteractor.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 19/03/21.
//

import Foundation
import UIKit.UIImage

class CountryDetailInteractor {
    
    private let country2Code: String
    var presenter: CountryDetailInteractorToPresenter?
    private let service = GenericBasicService()
    private var countryDetail: CountryDetail?
    
    init(code: String) {
        self.country2Code = code
    }
    
}

extension CountryDetailInteractor: CountryDetailPresenterToInteractor {
    
    func retriveCountryDetail() {
        if let countryDetail = DBManager.shared.getCountryDetal(alpha2Code: self.country2Code) {
            self.countryDetail = countryDetail
            self.presenter?.setCountryDetail(countryDetail: countryDetail, isLocalData: true)
        }else {
            self.service.get(url: service.basicURL + "alpha/" + country2Code, expectedResponse: CountryDetail.self) { [weak self] (result) in
                switch result {
                case .success(let countryDetail):
                    self?.countryDetail = countryDetail
                    self?.presenter?.setCountryDetail(countryDetail: countryDetail, isLocalData: false)
                case .failure(let error):
                    self?.presenter?.didRetriveCountryDetailError(message: error.errorDescription)
                }
            }
        }        
    }
    
    func retriveFlagImage() {
        self.service.getImage(url:"https://flagpedia.net/data/flags/w1160/" + country2Code.lowercased() + ".png") { (result) in
            switch result {
            case .success(let image):
                self.presenter?.setFlagImage(image: image)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func storeCountryDetailInDB() {
        guard let countryDetail = self.countryDetail else {
            return
        }
        
        guard DBManager.shared.storeCountryDetail(countryDetail: countryDetail, alpha2Code: self.country2Code) else {
            return
        }
        
        self.presenter?.didCountryDetailSaved()
    }
    
    func removeCountryDetail() {
        guard DBManager.shared.removeCountryDetail(countryAlpha2Code: self.country2Code) else {
            return
        }
        
        self.presenter?.didCountryDetailDeleted()
    }
}
