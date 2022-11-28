//
//  DetailsViewController.swift
//  Homework_2.28_5_ContactList_Rebuild
//
//  Created by Ravil on 26.11.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var contact: Contact!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = contact.fullName
        nameLabel.text = contact.name
        surnameLabel.text = contact.surname
        phoneLabel.text = contact.phone
        emailLabel.text = contact.email
    }
}
