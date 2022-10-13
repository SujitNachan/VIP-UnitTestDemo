//
//  HomeMockRouter.swift
//  MediaMagicTests
//
//  Created by  on 13/10/22.
//  Copyright © 2022 Sujit Nachan. All rights reserved.
//

import Foundation
@testable import MediaMagic

class HomeMockRouter: HomeViewRouterInterface {
    private(set) var navigateToDetailsScreen = false
    
    func navigateToDetailsScreen(homeCollectionViewModel: HomeCollectionViewModel) {
        navigateToDetailsScreen = true
    }
}
