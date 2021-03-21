//
//  CountriesRouter.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 18/03/21.
//

import Foundation
import UIKit.UIViewController

class CountriesRouter {
    
    var view: UIViewController?
    
    static func createCountriesModule() -> UIViewController {
        let view = CountriesViewController(nibName: "CountriesViewController", bundle: .main)
        let presenter = CountriesPresenter()
        let interactor = CountriesInteractor()
        let router = CountriesRouter()
        router.view = view
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }

}

extension CountriesRouter: CountriesPresenterToRouter {
    func goToCountryDetail(countryCode: String) {
        let detailView = CountryDetailRouter.createCountryDetail(countryCode: countryCode)
        self.view?.parent?.navigationController?.pushViewController(detailView, animated: true)
    }
}
