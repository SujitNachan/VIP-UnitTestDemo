//
//  HomeViewInteractor.swift
//  MediaMagic
//
//  Created by  on 15/09/22.
//  Copyright © 2022 Sujit Nachan. All rights reserved.
//

import Foundation

class HomeViewInteractor {
    private let presenter: HomeViewPresenterInterface
    private let router: HomeViewRouterInterface
    private let service: ServiceProtocol
    private var photos: [Photos]?
    
    init(presenter: HomeViewPresenterInterface, router: HomeViewRouterInterface, service: ServiceProtocol) {
        self.presenter = presenter
        self.router = router
        self.service = service
    }
}

extension HomeViewInteractor: HomeViewInteractorInterface {
    func fetchPhotos() {
        presenter.showActivityIndicator()
        service.fetchPhotos { [weak self] result in
            guard let self = self else { return }
            self.presenter.hideActivityIndicator()
            switch result {
            case .sucess(let response):
                self.photos = response.photos
                self.presenter.update(photos: response.photos ?? [])
                break
            case .failure(let error):
                break
            }
        }
    }
}
