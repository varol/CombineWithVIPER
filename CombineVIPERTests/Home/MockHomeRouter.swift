//
//  MockHomeRouter.swift
//  CombineVIPERTests
//
//  Created by Varol Aksoy on 22.05.2022.
//

@testable import CombineVIPER
import Foundation

final class MockHomeRouter: HomeRouterInterface {

    var invokedNavigate = false
    var invokedNavigateCount = 0
    var invokedNavigateParameters: (route: HomeRoutes, Void)?
    var invokedNavigateParametersList = [(route: HomeRoutes, Void)]()

    func navigate(_ route: HomeRoutes) {
        invokedNavigate = true
        invokedNavigateCount += 1
        invokedNavigateParameters = (route, ())
        invokedNavigateParametersList.append((route, ()))
    }
}
