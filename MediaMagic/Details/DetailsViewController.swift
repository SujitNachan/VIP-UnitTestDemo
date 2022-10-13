//
//  DetailsViewController.swift
//  MediaMagic
//
//  Created by  on 17/09/22.
//  Copyright © 2022 Sujit Nachan. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    private let interactor: DetailsViewInteractorInterface
    
    init(interactor: DetailsViewInteractorInterface) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = interactor.getDisplayData().text
        view.backgroundColor = .clear
    }
}

extension DetailsViewController: DetailsViewControllerInterface {
    
}
