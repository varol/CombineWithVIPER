//
//  HomePresenter.swift
//  BaseVIPER
//
//  Created by Varol Aksoy on 15.04.2022.
//

import Foundation

protocol HomePresenterInterface: AnyObject {
    func viewDidLoad()
}

final class HomePresenter: HomePresenterInterface {

    unowned private var view: HomeViewControllerInterface!
    private let router: HomeRouterInterface!
    private let interactor: HomeInteractorInterface!

    init(interactor: HomeInteractorInterface,
         router: HomeRouterInterface,
         view: HomeViewControllerInterface) {

        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        
    }
}

extension HomePresenter: HomeInteractorOutputInterface {

}
