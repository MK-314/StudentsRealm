//
//  StudentViewModel.swift
//  StudentsRealm
//
//  Created by Mikhail Kashkov on 2022-03-08.
//

import Foundation
import Combine
import RealmSwift

final class StudentViewModel: ObservableObject {
    @Published var students: [Student] = [
        Student(id: "1", firstName: "firstName1", secondName: "secondName1"),
        Student(id: "2", firstName: "firstName2", secondName: "secondName2"),
        Student(id: "3", firstName: "firstName3", secondName: "secondName3"),
        Student(id: "4", firstName: "firstName4", secondName: "secondName4"),
    ]

    func addStudent(firstName: String, secondName: String) {
        let randomInt = Int.random(in: 5..<777)
        self.students.append(Student(id: String(randomInt), firstName: firstName, secondName: secondName))
    }

    func remove(id: String) {
        for (index, student) in students.enumerated() {
            if id == student.id {
                students.remove(at: index)
            }
        }
    }

    func update(id: String, newFirstName: String, newSecondName: String) {
    }
}