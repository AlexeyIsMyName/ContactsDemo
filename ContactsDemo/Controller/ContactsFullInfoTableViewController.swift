//
//  ContactsFullInfoTableViewController.swift
//  ContactsDemo
//
//  Created by ALEKSEY SUSLOV on 02.08.2022.
//

import UIKit

class ContactsFullInfoTableViewController: UITableViewController {
    
    var contacts: [Person]!

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return contacts.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "section")
        let person = contacts[section]
        var content = cell.defaultContentConfiguration()
        content.text = person.fullName
        cell.contentConfiguration = content
        
        cell.backgroundColor = .systemGray6
        return cell
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        if indexPath.row == 0 {
            let person = contacts[indexPath.section]
            var content = cell.defaultContentConfiguration()
            content.image = UIImage(systemName: "phone")
            content.text = person.phoneNumber
            cell.contentConfiguration = content
        } else {
            let person = contacts[indexPath.section]
            var content = cell.defaultContentConfiguration()
            content.image = UIImage(systemName: "envelope")
            content.text = person.email
            cell.contentConfiguration = content
        }
        
        return cell
    }
}
