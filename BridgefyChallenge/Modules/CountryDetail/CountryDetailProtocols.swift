//
//  CountryDetailProtocols.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 19/03/21.
//

import Foundation
import UIKit.UIImage

protocol CountryDetailViewToPresenter: class {
    func getCountryDetail()
    func getFlagImage()
    func getOutFromDetail()
}

protocol CountryDetailPresenterToView: class {
    func setCountryDetail(countryDetail: CountryDetail)
    func showFlagImage(image: UIImage)
}

protocol CountryDetailPresenterToInteractor: class {
    func retriveCountryDetail()
    func retriveFlagImage()
}

protocol CountryDetailInteractorToPresenter: class {
    func setCountryDetail(countryDetail: CountryDetail)
    func setFlagImage(image: UIImage)
}

protocol CountryDetailPresenterToRouter: class {
    func goToPreviewModule()
}
