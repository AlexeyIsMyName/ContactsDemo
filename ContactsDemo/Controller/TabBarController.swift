//
//  TabBarController.swift
//  ContactsDemo
//
//  Created by ALEKSEY SUSLOV on 02.08.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    private let contacts = DataManager.shared.fetchContacts()

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareVC()
    }
    
    private func prepareVC() {
        guard let viewControllers = viewControllers else { return }
        
        for viewController in viewControllers {
            guard let navigationVC = viewController as? UINavigationController else { return }
            
            if let contactsFullNameTVC = navigationVC.topViewController as? ContactsFullNameTableViewController {
                contactsFullNameTVC.contacts = contacts
            }
            
            if let contactsFullInfoTVC = navigationVC.topViewController as? ContactsFullInfoTableViewController {
                contactsFullInfoTVC.contacts = contacts
            }
        }
    }
}
