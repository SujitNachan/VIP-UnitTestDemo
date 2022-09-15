//
//  HomeCollectionViewCell.swift
//  MediaMagic
//
//  Created by  on 15/09/22.
//  Copyright © 2022 Sujit Nachan. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell, ReusableView {

    //MARK: Outlet
    @IBOutlet weak var imgView: CustomImageView!
    @IBOutlet weak var label: UILabel!
    
    var celldata: Photos? {
        didSet {
            imgView.loadImage(urlString: celldata?.photoURL)
            label.text = celldata?.author
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
