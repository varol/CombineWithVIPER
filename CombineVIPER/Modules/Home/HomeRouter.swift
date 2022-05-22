//
//  HomeRouter.swift
//  BaseVIPER
//
//  Created by Varol Aksoy on 15.04.2022.
//

import UIKit

protocol HomeRouterInterface: AnyObject {
    func navigate(_ route: HomeRoutes)
}

enum HomeRoutes {
    case details(station: Station)
}

final class HomeRouter: NSObject {

    var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    static func setupModule(navigationController: UINavigationController) -> HomeViewController {
        let view = HomeViewController()
        let interactor = HomeInteractor()
        let router = HomeRouter(navigationController: navigationController)
        let presenter = HomePresenter(interactor: interactor, router: router, view: view)
        view.presenter = presenter
        view.title = "Stations"
        return view
    }
}

extension HomeRouter: HomeRouterInterface {
    func navigate(_ route: HomeRoutes) {
        switch route {
        case .details(let station):
            let detailVC = DetailsRouter.setupModule(station: station)
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}

