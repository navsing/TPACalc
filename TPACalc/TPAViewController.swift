//
//  TPAViewController.swift
//  HamburgerMenu
//
//  Created by Navdeep Singh on 4/6/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//



import UIKit

class TPAViewController: UIViewController{
    
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "doctor"))
        self.view.contentMode = UIViewContentMode.scaleAspectFill
        self.view.clipsToBounds = true
        self.view.center = view.center
        UIScreen.main.bounds
        
        // burger side bar menu
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            }

        }
}
