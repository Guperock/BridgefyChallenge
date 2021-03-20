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
}

extension CountryDetailPresenter: CountryDetailInteractorToPresenter {
    
    func setCountryDetail(countryDetail: CountryDetail) {
        self.view?.setCountryDetail(countryDetail: countryDetail)
    }
    
    func setFlagImage(image: UIImage) {
        self.view?.showFlagImage(image: image)
    }
    
}
