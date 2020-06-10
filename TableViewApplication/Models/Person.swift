//
//  Person.swift
//  TableViewApplication
//
//  Created by mac on 10.06.2020.
//  Copyright © 2020 Oleg Stasiw. All rights reserved.
//

struct Person {
    let name: String
    let surname: String
    let number: String
    let email: String
}


extension Person {
    static func getAllData() -> [Person] {
        let data = DataManager()
        let names = data.name.shuffled()
        let surnames = data.surname.shuffled()
        let numbers = data.number.shuffled()
        let emails = data.email.shuffled()
        var somePersons = [Person]()

        for index in 0..<names.count {
            somePersons.append(Person(name: names[index],
                                    surname: surnames[index],
                                    number: numbers[index],
                                    email: emails[index]))
        }
        return somePersons

    }
}
