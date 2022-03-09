//
// Created by Mikhail Kashkov on 2022-03-08.
//

import SwiftUI

struct StudentView: View {
    let student: Student
    @State private var firstName: String = ""
    @State private var secondName: String = ""
    @EnvironmentObject private var viewModel: StudentViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
            HStack {
                Text(student.firstName + " " + student.secondName)
                        .font(.system(size: 30))
                        .bold()
            }
            VStack {
                TextField("Type First Name ...", text: $firstName)
                        .padding()
                        .background(Color(.systemGray6))
                TextField("Type Second Name ...", text: $secondName)
                        .padding()
                        .background(Color(.systemGray6))
            }
                    .padding(20)
            HStack {
                Button(action: deleteAction) {
                    HStack {
                        Image(systemName: "trash.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color(.red))
                        Text("Delete").bold()
                    }
                }
                Spacer()
                Button(action: updateAction) {
                    HStack {
                        Image(systemName: "arrow.triangle.2.circlepath.circle")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color(.green))
                        Text("Update").bold()
                    }
                }
            }
                    .padding(.horizontal, 100)
        }
                .padding(.top,-200)
    }

    private func deleteAction() {
        viewModel.remove(id: student.id)
        presentationMode.wrappedValue.dismiss()
    }

    private func updateAction() {
        viewModel.update(id: student.id, newFirstName: firstName, newSecondName: secondName)
        firstName = ""
        secondName = ""
    }
}
