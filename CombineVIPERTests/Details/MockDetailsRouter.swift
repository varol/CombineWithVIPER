//
//  MockDetailsRouter.swift
//  CombineVIPERTests
//
//  Created by Varol Aksoy on 22.05.2022.
//

@testable import CombineVIPER
import Foundation

final class MockDetailsRouter: DetailsRouterInterface {

    var invokedNavigate = false
    var invokedNavigateCount = 0
    var invokedNavigateParameters: (route: DetailsRoutes, Void)?
    var invokedNavigateParametersList = [(route: DetailsRoutes, Void)]()

    func navigate(_ route: DetailsRoutes) {
        invokedNavigate = true
        invokedNavigateCount += 1
        invokedNavigateParameters = (route, ())
        invokedNavigateParametersList.append((route, ()))
    }
}
