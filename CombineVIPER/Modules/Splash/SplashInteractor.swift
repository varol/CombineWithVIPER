//
//  SplashInteractor.swift
//  BaseVIPER
//
//  Created by Varol Aksoy on 15.04.2022.
//

import Foundation

protocol SplashInteractorInterface: AnyObject {

}

protocol SplashInteractorOutputInterface: AnyObject {

}

final class SplashInteractor {
    var output: SplashInteractorOutputInterface?
}

extension SplashInteractor: SplashInteractorInterface {

}
