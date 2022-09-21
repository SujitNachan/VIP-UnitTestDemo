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
    func photoDidSelect(homeCollectionViewModel: HomeCollectionViewModel) {
        router.navigateToDetailsScreen(homeCollectionViewModel: homeCollectionViewModel)
    }
    
    func fetchPhotos() {
        presenter.showActivityIndicator()
        service.fetchPhotos { [weak self] result in
            guard let self = self else { return }
            self.presenter.hideActivityIndicator()
            switch result {
            case .sucess(let response):
                self.photos = response.photos
                
                
                self.presenter.update(photos: response.photos?.compactMap({ HomeCollectionViewModel(text: $0.author, imageURL: $0.photoURL)}) ?? [])
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.presenter.showAlertView(message: error.localizedDescription)
                }
            }
        }
    }
    
    
}

