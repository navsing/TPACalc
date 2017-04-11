//
//  CoursesTableViewController.swift
//  Developers Academy
//
//  Created by Duc Tran on 11/27/15.
//  Copyright © 2015 Developers Academy. All rights reserved.
//

import UIKit
import SafariServices       // for SFSafariViewController
import LocalAuthentication  // for touch id authentication
import Social               // for facebook and twitter sharing

class CoursesTableViewController: UITableViewController
{
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var programs: [Program] = [Program.TotalIOSBlueprint(), Program.SocializeYourApps()]
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make the row height dynamic
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    
        displayWalkthroughs()
        
        // burger side bar menu
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    func displayWalkthroughs()
    {
        // Create the walkthrough screens
        let userDefaults = UserDefaults.standard
        let displayedWalkthrough = userDefaults.bool(forKey: "DisplayedWalkthrough")
        if !displayedWalkthrough {
            if let pageViewController = storyboard?.instantiateViewController(withIdentifier: "PageViewController") as? PageViewController {
                self.present(pageViewController, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return programs.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return programs[section].courses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Course Cell", for: indexPath) as! CourseTableViewCell
        
        let program = programs[indexPath.section]
        let courses = program.courses
        cell.course = courses[indexPath.row]
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let program = programs[indexPath.section]
        let url = program.url
        
        showWebsite(url)
    }
    
    // MARK: - Show Webpage with SFSafariViewController
    
    func showWebsite(_ url: String)
    {
        let webVC = SFSafariViewController(url: URL(string: url)!)
        webVC.delegate = self
        
        self.present(webVC, animated: true, completion: nil)
    }
    
    // MARK: - Target / Action
    
    @IBAction func signupClicked(_ sender: AnyObject)
    {
        self.tabBarController?.selectedIndex = 2
    }
    
    
}

extension CoursesTableViewController : SFSafariViewControllerDelegate
{
    func safariViewControllerDidFinish(_ controller: SFSafariViewController)
    {
        controller.dismiss(animated: true, completion: nil)
    }
}












