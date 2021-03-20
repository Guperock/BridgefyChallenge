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
    
    init(code: String) {
        self.country2Code = code
    }
    
}

extension CountryDetailInteractor: CountryDetailPresenterToInteractor {
    
    func retriveCountryDetail() {
        self.service.get(url: service.basicURL + "alpha/" + country2Code, expectedResponse: CountryDetail.self) { [weak self] (result) in
            switch result {
            case .success(let country):
                self?.presenter?.setCountryDetail(countryDetail: country)
            case .failure(let error):
                print(error.localizedDescription)
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
}
