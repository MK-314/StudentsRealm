//
// Created by Mikhail Kashkov on 2022-03-08.
//

import Foundation

struct Student: Identifiable {
    var id: String
    var firstName: String
    var secondName: String

    init(studentObject: StudentObject) {
        self.id = studentObject.id.stringValue
        self.firstName = studentObject.firstName
        self.secondName = studentObject.secondName
    }
}
