//
//  TPA.swift
//  HamburgerMenu
//
//  Created by Navdeep Singh on 4/5/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import UIKit

class TPA
{
    var title = ""
    var description = ""
    var image: UIImage!
    var programURL = ""
    
    init(title: String, description: String, image: UIImage, programURL: String)
    {
        self.title = title
        self.description = description
        self.image = image
        self.programURL = programURL
    }
}
