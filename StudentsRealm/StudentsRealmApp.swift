//
//  StudentsRealmApp.swift
//  StudentsRealm
//
//  Created by Mikhail Kashkov on 2022-03-08.
//

import SwiftUI

@main
struct StudentsApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(StudentViewModel())
        }
    }
}
