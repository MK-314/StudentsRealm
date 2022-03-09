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
    @Published var students: [Student] = []
    private var token: NotificationToken?

    init() {
        setupObserver()
    }

    deinit {
        token?.invalidate()
    }

    private func setupObserver() {
        do {
            let realm = try Realm()
            let results = realm.objects(StudentObject.self)

            token = results.observe({ [weak self] changes in
                self?.students = results.map(Student.init)
            })
        } catch let error {
            print(error.localizedDescription)
        }
    }

    func addStudent(firstName: String, secondName: String) {
        let studentObject = StudentObject(value: [
            "firstName": firstName,
            "secondName": secondName,
        ])
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(studentObject)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }

    func remove(id: String) {
        do {
            let realm = try Realm()
            let objectId = try ObjectId(string: id)
            if let student = realm.object(ofType: StudentObject.self, forPrimaryKey: objectId) {
                try realm.write {
                    realm.delete(student)
                }
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }

    func update(id: String, newFirstName: String, newSecondName: String) {
        do {
            let realm = try Realm()
            let objectId = try ObjectId(string: id)
            let student = realm.object(ofType: StudentObject.self, forPrimaryKey: objectId)
            try realm.write {
                student?.firstName = newFirstName
                student?.secondName = newSecondName
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
}