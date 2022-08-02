//
//  ContactsFullNameTableViewController.swift
//  ContactsDemo
//
//  Created by ALEKSEY SUSLOV on 02.08.2022.
//

import UIKit

class ContactsFullNameTableViewController: UITableViewController {
    
    var contacts: [Person]!

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fullNameCell", for: indexPath)
        let person = contacts[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = person.fullName
        cell.contentConfiguration = content
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsContactVC = segue.destination as? DetailsContactViewController else { return }
        guard let index = tableView.indexPathForSelectedRow?.row else { return }
        detailsContactVC.contact = contacts[index]
    }
}
