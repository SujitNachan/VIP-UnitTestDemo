//
//  BaseViewModel.swift
//  MediaMagic
//
//  Created by Sujit Nachan on 31/08/20.
//  Copyright © 2020 Sujit Nachan. All rights reserved.
//

import Foundation

protocol BaseViewModelProtocol: NSObjectProtocol {
    func showActivityIndicator()
    func hideActivityIndicator()
    func showInternalMessage(error: String)
    func refreshUI()
}

class BaseViewModel: NSObject {
    //MARK: Properties
    weak var baseViewModelProtocol: BaseViewModelProtocol?
    
    init(viewModelProtocol: BaseViewModelProtocol?) {
        baseViewModelProtocol = viewModelProtocol
    }
}
