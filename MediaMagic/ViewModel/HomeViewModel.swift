//
//  HomeViewModel.swift
//  MediaMagic
//
//  Created by Sujit Nachan on 31/08/20.
//  Copyright © 2020 Sujit Nachan. All rights reserved.
//

import Foundation

class HomeViewModel: BaseViewModel {
    
    private var photos = [Photos]()
    
    func fetchPhotos() {
        self.baseViewModelProtocol?.showActivityIndicator()
        APIManager.shared.fetchData(urlString: APIManager.shared.photosURL) { [weak self] (data, error) in
            guard let self = self else { return }
            DispatchQueue.main.async { [weak self] in
                self?.baseViewModelProtocol?.hideActivityIndicator()
            }
            if let data = data {
                do {
                    let baseJson = try JSONDecoder().decode([Photos].self, from: data)
                    self.photos = baseJson
                    DispatchQueue.main.async { [weak self] in
                        self?.baseViewModelProtocol?.refreshUI()
                    }
                } catch let error {
                    self.baseViewModelProtocol?.showInternalMessage(error: error.localizedDescription)
                }
            }
            if let error = error {
                self.baseViewModelProtocol?.showInternalMessage(error: error.localizedDescription)
            }
        }
    }
    
    func numberOfRows() -> Int {
        return photos.count
    }
    
    func getPhotoAt(index: Int) -> Photos? {
        if photos.count > index {
            return photos[index]
        }
        return nil
    }
}

