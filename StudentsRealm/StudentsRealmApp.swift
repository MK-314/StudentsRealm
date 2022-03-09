//
//  StudentsRealmApp.swift
//  StudentsRealm
//
//  Created by Mikhail Kashkov on 2022-03-08.
//

import SwiftUI

@main
struct StudentsApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(StudentViewModel())
        }
    }
}
