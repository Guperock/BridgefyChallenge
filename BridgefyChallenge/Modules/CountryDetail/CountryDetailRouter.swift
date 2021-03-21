//
//  CountryDetailRouter.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 19/03/21.
//

import Foundation
import UIKit.UICollectionView

class CountryDetailRouter {
    
    var view: UIViewController?
    
    static func createCountryDetail(countryCode: String) -> UIViewController {
        let view = CountryDetailViewController(nibName: "CountryDetailViewController", bundle: .main)
        let presenter = CountryDetailPresenter()
        let interactor = CountryDetailInteractor(code: countryCode)
        let router = CountryDetailRouter()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.view = view
        return view
    }
    
}

extension CountryDetailRouter: CountryDetailPresenterToRouter {
    func goToPreviewModule() {
        self.view?.navigationController?.popViewController(animated: true)
    }
}
