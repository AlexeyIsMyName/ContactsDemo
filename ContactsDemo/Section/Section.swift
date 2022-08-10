//
//  Section.swift
//  ContactsDemo
//
//  Created by ALEKSEY SUSLOV on 10.08.2022.
//

struct Section {
    let title: String
    let rows: [String]
    var expended: Bool
    
    static func getSections(persons: [Person]) -> [Section] {
        var sections: [Section] = []
        
        persons.forEach { person in
            let section = Section(
                title: person.fullName,
                rows: [person.phoneNumber, person.email],
                expended: false
            )
            sections.append(section)
        }
        
        return sections
    }
}
