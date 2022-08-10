//
//  ContactsFullInfoTableViewController.swift
//  ContactsDemo
//
//  Created by ALEKSEY SUSLOV on 02.08.2022.
//

import UIKit

protocol ExpandableHederViewDelegate {
    func toggle(sectionIndex: Int)
}

class ContactsFullInfoTableViewController: UITableViewController {
    
    var sections: [Section]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.sectionHeaderTopPadding = 2
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        let section = sections[indexPath.section]
        var content = cell.defaultContentConfiguration()
        
        content.text = section.rows[indexPath.row]
        content.image = indexPath.row == 0
            ? UIImage(systemName: "phone")
            : UIImage(systemName: "tray")
        
        cell.contentConfiguration = content
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ContactsFullInfoTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        ExpandableHeaderView(title: sections[section].title, sectionIndex: section, delegate: self)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        44
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        sections[indexPath.section].expended ? 44 : 0
    }
}

// MARK: - ExpandableHederViewDelegate
extension ContactsFullInfoTableViewController: ExpandableHederViewDelegate {
    func toggle(sectionIndex: Int) {
        sections[sectionIndex].expended.toggle()
        
        tableView.beginUpdates()
        
        for rowIndex in 0..<sections[sectionIndex].rows.count {
            let indexPath = IndexPath(row: rowIndex, section: sectionIndex)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        tableView.endUpdates()
    }
}
