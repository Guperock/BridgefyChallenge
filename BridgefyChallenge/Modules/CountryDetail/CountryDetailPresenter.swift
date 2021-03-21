//
//  CountryDetailPresenter.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 19/03/21.
//

import Foundation
import UIKit.UIImage

class CountryDetailPresenter {
    
    var view: CountryDetailPresenterToView?
    var interactor: CountryDetailPresenterToInteractor?
    var router: CountryDetailPresenterToRouter?
    
}

extension CountryDetailPresenter: CountryDetailViewToPresenter {
    
    func getCountryDetail() {
        self.interactor?.retriveCountryDetail()
    }
    
    func getFlagImage() {
        self.interactor?.retriveFlagImage()
    }
    
    func getOutFromDetail() {
        self.router?.goToPreviewModule()
    }
    
    func saveCountryDetail() {
        self.interactor?.storeCountryDetailInDB()
    }
    
    func deleteCountryDetail() {
        self.interactor?.removeCountryDetail()
    }
}

extension CountryDetailPresenter: CountryDetailInteractorToPresenter {
    
    func didRetriveCountryDetailError(message: String) {
        self.view?.showErrorMessage(message: message)
    }
    
    
    func setCountryDetail(countryDetail: CountryDetail, isLocalData: Bool) {
        self.view?.setCountryDetail(countryDetail: countryDetail, isLocalData: isLocalData)
    }
    
    func setFlagImage(image: UIImage) {
        self.view?.showFlagImage(image: image)
    }
    
    func didCountryDetailSaved() {
        self.view?.didCountryDetailSaved()
    }
    
    func didCountryDetailDeleted() {
        self.view?.didCountryDetailDeleted()
    }
}
