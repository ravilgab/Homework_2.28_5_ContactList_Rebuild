//
//  TabBarViewController.swift
//  Homework_2.28_5_ContactList_Rebuild
//
//  Created by Ravil on 28.11.2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        guard let contactListVC = viewControllers?.first as? ContactListTableViewController else { return }
        guard let segmentedVC = viewControllers?.last as? SegmentedTableViewController else { return }
        
        let contacts = Contact.getContact()
        contactListVC.contacts = contacts
        segmentedVC.contacts = contacts
    }
}
