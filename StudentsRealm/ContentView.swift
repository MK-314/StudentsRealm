//
//  ContentView.swift
//  StudentsRealm
//
//  Created by Mikhail Kashkov on 2022-03-08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                AddStudentView()
                StudentListView()
            }
                    .navigationTitle("Students of 2305")
                    .navigationBarTitleDisplayMode(.automatic)
        }
    }
}