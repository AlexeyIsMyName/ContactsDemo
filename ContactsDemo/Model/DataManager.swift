//
//  DataManager.swift
//  ContactsDemo
//
//  Created by ALEKSEY SUSLOV on 02.08.2022.
//

class DataManager {
    let shared = DataManager()
    
    private var names = [
        "Nicola",
        "Bruce",
        "John",
        "Ted",
        "Steven",
        "Carl",
        "Aaron",
        "Sharon",
        "Tim",
        "Allan"
    ]
    
    private var surnames = [
        "Smith",
        "Robertson",
        "Williams",
        "Jankin",
        "Pennyworth",
        "Black",
        "Isaacson",
        "Butler",
        "Dow",
        "Murphy"
    ]
    
    private var emails = [
        "crazy535@cluud.com",
        "mad.joker29@cluud.com",
        "bad.boy11@cluud.com",
        "mr.white98@cluud.com",
        "morty.mail99@cluud.com",
        "myMail8888@cluud.com",
        "doNotMassageMe.999@cluud.com",
        "flowerLover111@cluud.com",
        "iOSDeveloper8877551@cluud.com",
        "appleForever.apple99@cluud.com"
    ]
    
    private var phoneNumbers = [
        "3-00-535-10001",
        "3-91-446-29002",
        "3-82-357-38003",
        "3-73-268-47004",
        "3-64-179-56005",
        "3-55-080-65006",
        "3-46-991-74007",
        "3-37-802-83008",
        "3-28-713-92009",
        "3-19-624-01010"
    ]
    
    func fetchContacts() -> [Person] {
        var contacts = [Person]()
        
        let minimumElementCount = min(names.count, surnames.count, emails.count, phoneNumbers.count)
        
        names.shuffle()
        surnames.shuffle()
        emails.shuffle()
        phoneNumbers.shuffle()
        
        for index in 0...minimumElementCount - 1 {
            contacts.append(Person(name: names[index],
                                   surname: surnames[index],
                                   email: emails[index],
                                   phoneNumber: phoneNumbers[index]))
        }
        
        return contacts
    }
    
    private init() {}
}