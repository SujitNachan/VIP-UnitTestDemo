//
//  HomeMockService.swift
//  MediaMagicTests
//
//  Created by  on 13/10/22.
//  Copyright © 2022 Sujit Nachan. All rights reserved.
//

import Foundation
@testable import MediaMagic

class HomeMockService: ServiceProtocol, Task {
    let shouldFailed: Bool
    
    init(shouldFailed: Bool = false) {
        self.shouldFailed = shouldFailed
    }
    
    func fetchPhotos(completion: @escaping (Result<ResponeModel, Error>) -> Void) -> Task {
        if shouldFailed {
            completion(.failure(NSError(domain: "Failed", code: 0)))
            return self
        }
        let responseModel = ResponeModel(photos: [Photos(format: "", width: nil, height: nil, filename: "abc", id: 123, author: nil, author_url: nil, post_url: nil), Photos(format: "", width: nil, height: nil, filename: "xyz", id: 321, author: nil, author_url: nil, post_url: nil)])
        completion(.success(responseModel))
        return self
    }
    
    func cancel() {
        
    }
}
