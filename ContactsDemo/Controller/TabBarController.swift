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
        
    }
}
