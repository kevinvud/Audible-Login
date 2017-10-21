//
//  Page.swift
//  Audible Login
//
//  Created by PoGo on 10/20/17.
//  Copyright © 2017 PoGo. All rights reserved.
//

import Foundation

struct Page {
    let title: String
    let imageName: String
    let message: String
    
    init(title: String, message: String, imageName: String) {
        self.title = title
        self.imageName = imageName
        self.message = message
    }
}
