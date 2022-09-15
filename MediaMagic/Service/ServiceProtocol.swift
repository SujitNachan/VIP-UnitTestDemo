//
//  ServiceProtocol.swift
//  MediaMagic
//
//  Created by  on 15/09/22.
//  Copyright © 2022 Sujit Nachan. All rights reserved.
//

import Foundation

enum Result<Value, Error> {
    case sucess(Value)
    case failure(Error)
}

struct ResponeModel {
    let photos: [Photos]?
    
    init (photos: [Photos]? = nil) {
        self.photos = photos
    }
}

protocol ServiceProtocol {
    func fetchPhotos(completion: @escaping (Result<ResponeModel, Error>) -> Void)
}

class HomeService: ServiceProtocol {
    func fetchPhotos(completion: @escaping ((Result<ResponeModel, Error>) -> Void)) {
        APIManager.shared.fetchData(urlString: APIManager.shared.photosURL) { (data, error) in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                do {
                    let baseJson = try JSONDecoder().decode([Photos].self, from: data)
                    completion(.sucess(ResponeModel(photos: baseJson)))
                    
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
    }
}
