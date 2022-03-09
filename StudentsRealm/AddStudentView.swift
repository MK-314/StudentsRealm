//
// Created by Mikhail Kashkov on 2022-03-08.
//

import SwiftUI

struct AddStudentView: View {
    @State private var firstName: String = ""
    @State private var secondName: String = ""
    @EnvironmentObject private var viewModel: StudentViewModel

    var body: some View {
        Text("Add New Student")
                .bold()
                .padding()
        VStack {
            TextField("Type First Name ...", text: $firstName)
                    .padding()
                    .background(Color(.systemGray6))
            TextField("Type Second Name ...", text: $secondName)
                    .padding()
                    .background(Color(.systemGray6))
            Button(action: handleSubmit) {
                Image(systemName: "plus")
                        .padding()
                        .background(Color(.systemGray3))
                        .clipShape(Circle())
                        .foregroundColor(.black)
            }
        }
                .padding(20)
    }

    private func handleSubmit() {
        viewModel.addStudent(firstName: firstName, secondName: secondName)
        firstName = ""
        secondName = ""
    }
}
