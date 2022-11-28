//
//  ContactListTableViewController.swift
//  Homework_2.28_5_ContactList_Rebuild
//
//  Created by Ravil on 26.11.2022.
//

import UIKit

class ContactListTableViewController: UITableViewController {
    
//    var contacts = Contact.getContact()
    var contacts: [Contact] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = editButtonItem
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath)

        let contact = contacts[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = contact.fullName
        content.secondaryText = contact.phone
        content.secondaryTextProperties.color = UIColor.gray
        
        cell.contentConfiguration = content

        return cell
    }
    
    // MARK: - Table view delegate
    
    // высота ячейки
    override func tableView(_ tableView: UITableView,
        heightForRowAt indexPath: IndexPath) -> CGFloat {
        64
    }
    
    // отключение сдвигания ячейки вправо при редактировании
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    // отключение кнопки слева от ячейки при редактировании
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    // включение сэндвич меню и реализация изменения по индексам
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let currentContact = contacts.remove(at: sourceIndexPath.row)
        contacts.insert(currentContact, at: destinationIndexPath.row)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsVC = segue.destination as? DetailsViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }

        detailsVC.contact = contacts[indexPath.row]
    }
}
