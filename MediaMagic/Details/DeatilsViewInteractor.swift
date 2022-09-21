//
//  DeatilsViewInteractor.swift
//  MediaMagic
//
//  Created by  on 17/09/22.
//  Copyright © 2022 Sujit Nachan. All rights reserved.
//

import Foundation

class DetailsViewInteractor {
    private let presenter: DetailsViewPresenterInterface
    private let router: DetailsViewRouterInterface
    private let homeCollectionViewModel: HomeCollectionViewModel
    
    init(presenter: DetailsViewPresenterInterface, router: DetailsViewRouterInterface, homeCollectionViewModel: HomeCollectionViewModel) {
        self.presenter = presenter
        self.router = router
        self.homeCollectionViewModel = homeCollectionViewModel
     }
    
}

extension DetailsViewInteractor: DetailsViewInteractorInterface {
    func getDisplayData() -> HomeCollectionViewModel {
        return homeCollectionViewModel
    }
}
