//
//  SplashPresenter.swift
//  BaseVIPER
//
//  Created by Varol Aksoy on 15.04.2022.
//

import Foundation

protocol SplashPresenterInterface: AnyObject {
    func viewDidLoad()
}

final class SplashPresenter: SplashPresenterInterface {

    unowned private var view: SplashViewControllerInterface!
    private let router: SplashRouterInterface!
    private let interactor: SplashInteractorInterface!

    init(interactor: SplashInteractorInterface,
         router: SplashRouterInterface,
         view: SplashViewControllerInterface) {
        
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.router.navigate(.home)
        }
    }
}

extension SplashPresenter: SplashInteractorOutputInterface {

}
