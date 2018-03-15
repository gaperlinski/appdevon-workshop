//
//  NavigationBarStyling.swift
//  ThingSaver
//
//  Created by Grzegorz Aperlinski on 15/03/2018.
//  Copyright © 2018 Paul Hudson. All rights reserved.
//

import UIKit

protocol NavigationBarStylingProtocol {
    func setCustomTitle(str: String)
}

extension NavigationBarStylingProtocol where Self: UIViewController {
    func setCustomTitle(str: String) {
        title = str
        
        if let font = UIFont(name: "AvenirNext-Heavy", size: 30) {
            let attrs = [NSAttributedStringKey.font: font]
            navigationController?.navigationBar.titleTextAttributes = attrs
        }
    }
}
