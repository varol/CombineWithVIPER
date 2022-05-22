//
//  DetailsRouter.swift
//  CombineVIPER
//
//  Created by Varol Aksoy on 22.05.2022.
//

import UIKit

protocol DetailsRouterInterface: AnyObject {
    func navigate(_ route: DetailsRoutes)
}

enum DetailsRoutes {
    
}

final class DetailsRouter: NSObject {

    weak var presenter: DetailsPresenterInterface?
    weak var viewController: DetailsViewController?
    
    static func setupModule(station: Station) -> DetailsViewController {
        let vc = DetailsViewController()
        let interactor = DetailsInteractor()
        let router = DetailsRouter()
        let presenter = DetailsPresenter(interactor: interactor,
                                         router: router,
                                         view: vc,
                                         station: station)

        vc.presenter = presenter
        router.presenter = presenter
        interactor.output = presenter
        router.viewController = vc
        return vc
    }
}

extension DetailsRouter: DetailsRouterInterface {
    func navigate(_ route: DetailsRoutes) {
        
    }
}

