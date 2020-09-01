//
//  APIManager.swift
//  MediaMagic
//
//  Created by Sujit Nachan on 31/08/20.
//  Copyright © 2020 Sujit Nachan. All rights reserved.
//

import Foundation

class APIManager {
    
    static let shared = APIManager()
    let photosURL = "https://picsum.photos/list"
     
    private init() {
    }
    
    func fetchData(urlString: String, completion: @escaping ((_ data: Data?, _ error: Error?) -> Void)) {
        if let url = URL(string: urlString) {
            let req = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: req) { (data, response, error) in
                completion(data,error)
            }
            task.resume()
        }
    }
}
