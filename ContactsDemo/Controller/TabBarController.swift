//
//  TabBarController.swift
//  ContactsDemo
//
//  Created by ALEKSEY SUSLOV on 02.08.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    private let contacts = Person.getContacts()

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareVC()
    }
    
    private func prepareVC() {
        let contactsFullNameTVC = viewControllers?.first as! ContactsFullNameTableViewController
        let contactsFullInfoTVC = viewControllers?.last as! ContactsFullInfoTableViewController
        
        contactsFullNameTVC.contacts = contacts
        contactsFullInfoTVC.sections = Section.getSections(persons: contacts)
    }
}
