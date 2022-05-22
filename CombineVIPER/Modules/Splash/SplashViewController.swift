//
//  SplashViewController.swift
//  BaseVIPER
//
//  Created by Varol Aksoy on 15.04.2022.
//

import UIKit

protocol SplashViewControllerInterface: AnyObject {}

final class SplashViewController: BaseViewController {
    var presenter: SplashPresenterInterface!

    override func viewDidLoad() {
        presenter.viewDidLoad()
    }
}

extension SplashViewController: SplashViewControllerInterface {}
