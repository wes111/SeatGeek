//
//  UINavigationControllerExtensions.swift
//  SeatGeek
//
//  Created by Wesley Luntsford on 4/23/22.
//

import SwiftUI

extension UINavigationController {
    
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}
