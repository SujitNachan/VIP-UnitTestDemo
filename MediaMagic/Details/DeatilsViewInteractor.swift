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
    private let photoViewModel: PhotoViewModel
    
    init(presenter: DetailsViewPresenterInterface, router: DetailsViewRouterInterface, photoViewModel: PhotoViewModel) {
        self.presenter = presenter
        self.router = router
        self.photoViewModel = photoViewModel
     }
    
}

extension DetailsViewInteractor: DetailsViewInteractorInterface {
    func getDisplayData() -> PhotoViewModel {
        return photoViewModel
    }
}
