//
//  AspectController.swift
//  HamburgerMenu
//
//  Created by Navdeep Singh on 4/5/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//


import UIKit

class AspectController: UIViewController{
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
    
   
            override func viewDidLoad() {
                super.viewDidLoad()
                
                // burger side bar menu
                if revealViewController() != nil {
                    menuButton.target = revealViewController()
                    menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
                    view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
                }
            }
    
        
    
}
