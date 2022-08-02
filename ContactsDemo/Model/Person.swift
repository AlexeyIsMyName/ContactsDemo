//
//  Person.swift
//  ContactsDemo
//
//  Created by ALEKSEY SUSLOV on 02.08.2022.
//

struct Person {
    let name: String
    let surname: String
    let email: String
    let phoneNumber: String
    
    var fullName: String {
        return "\(name) \(surname)"
    }
}

extension Person {
    static func getContacts() -> [Person] {
        var contacts = [Person]()
        
        let names = DataManager.shared.names.shuffled()
        let surnames = DataManager.shared.surnames.shuffled()
        let emails = DataManager.shared.emails.shuffled()
        let phoneNumbers = DataManager.shared.phoneNumbers.shuffled()
        
        let minimumElementCount = min(names.count, surnames.count, emails.count, phoneNumbers.count)
        
        for index in 0..<minimumElementCount {
            contacts.append(Person(name: names[index],
                                   surname: surnames[index],
                                   email: emails[index],
                                   phoneNumber: phoneNumbers[index]))
        }
        
        return contacts
    }
}
