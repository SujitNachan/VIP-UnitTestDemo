//
//  ServiceProtocol.swift
//  MediaMagic
//
//  Created by  on 15/09/22.
//  Copyright © 2022 Sujit Nachan. All rights reserved.
//

import Foundation

struct ResponeModel {
    let photos: [Photos]?
    
    init (photos: [Photos]? = nil) {
        self.photos = photos
    }
}

protocol Task {
    func cancel()
}

protocol ServiceProtocol {
    func fetchPhotos(completion: @escaping (Result<ResponeModel, Error>) -> Void) -> Task
}

class HomeService: ServiceProtocol {
    func fetchPhotos(completion: @escaping ((Result<ResponeModel, Error>) -> Void)) -> Task {
        let task = APIManager.shared.fetchData(urlString: APIManager.shared.photosURL) { (data, error) in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                do {
                    let baseJson = try JSONDecoder().decode([Photos].self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(ResponeModel(photos: baseJson)))
                    }
                    
                } catch let error {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            }
        }
        return task
    }
}
