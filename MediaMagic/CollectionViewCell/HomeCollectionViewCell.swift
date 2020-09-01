//
//  HomeCollectionViewCell.swift
//  MediaMagic
//
//  Created by Sujit Nachan on 31/08/20.
//  Copyright © 2020 Sujit Nachan. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell, ReusableView, NibLoadableView {
    
}

class HomeCollectionViewCell: BaseCollectionViewCell {
    //MARK: Outlet
    @IBOutlet weak var imgView: CustomImageView!
    @IBOutlet weak var label: UILabel!
    
    var celldata: Photos? {
        didSet {
            imgView.loadImage(urlString: celldata?.photoURL)
            label.text = celldata?.author
        }
    }
}
