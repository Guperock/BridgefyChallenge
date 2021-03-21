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
    func saveCountryDetail()
    func deleteCountryDetail()
}

protocol CountryDetailPresenterToView: class {
    func setCountryDetail(countryDetail: CountryDetail, isLocalData: Bool)
    func showFlagImage(image: UIImage)
    func didCountryDetailSaved()
    func didCountryDetailDeleted()
    func showErrorMessage(message: String)
}

protocol CountryDetailPresenterToInteractor: class {
    func retriveCountryDetail()
    func retriveFlagImage()
    func storeCountryDetailInDB()
    func removeCountryDetail()
}

protocol CountryDetailInteractorToPresenter: class {
    func setCountryDetail(countryDetail: CountryDetail, isLocalData: Bool)
    func setFlagImage(image: UIImage)
    func didCountryDetailSaved()
    func didCountryDetailDeleted()
    func didRetriveCountryDetailError(message: String)
}

protocol CountryDetailPresenterToRouter: class {
    func goToPreviewModule()
}
