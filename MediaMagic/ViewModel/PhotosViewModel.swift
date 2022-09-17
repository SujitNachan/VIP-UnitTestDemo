//
//  PhotosViewModel.swift
//  MediaMagic
//
//  Created by  on 17/09/22.
//  Copyright © 2022 Sujit Nachan. All rights reserved.
//

import Foundation

class PhotoViewModel {
    private let photos: Photos
    init(photos: Photos) {
        self.photos = photos
    }
}

extension PhotoViewModel: HomeCollectionViewCellData {
    var imageURL: String? {
        get {
            return photos.photoURL
        }
    }
    
    var text: String? {
        get {
            return photos.author
        }
    }
}
