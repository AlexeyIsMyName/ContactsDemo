//
//  DetailsContactViewController.swift
//  ContactsDemo
//
//  Created by ALEKSEY SUSLOV on 02.08.2022.
//

import UIKit

class DetailsContactViewController: UIViewController {

    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    var contact: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = contact.fullName
        phoneNumberLabel.text = contact.phoneNumber
        emailLabel.text = contact.email
    }
}
