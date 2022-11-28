//
//  Contact.swift
//  Homework_2.28_5_ContactList_Rebuild
//
//  Created by Ravil on 26.11.2022.
//

struct Contact {
    let name: String
    let surname: String
    let phone: String
    let email: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}

extension Contact {
    static func getContact() -> [Contact] {
        var contacts: [Contact] = []
        
        let names = DataManager.shared.names.shuffled()
        let surnames = DataManager.shared.surnames.shuffled()
        let phoneNumbers = DataManager.shared.phoneNumbers.shuffled()
        let emails = DataManager.shared.emails.shuffled()
        
        let iterationsCount = min(
            names.count,
            surnames.count,
            phoneNumbers.count,
            emails.count
        )

        for index in 0..<iterationsCount {
            let contact = Contact(
                name: names[index],
                surname: surnames[index],
                phone: phoneNumbers[index],
                email: emails[index]
            )
            
            contacts.append(contact)
        }
        
        return contacts
    }
}
