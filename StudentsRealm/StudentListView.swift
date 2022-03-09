//
// Created by Mikhail Kashkov on 2022-03-08.
//

import SwiftUI

struct StudentListView: View {
    @EnvironmentObject private var viewModel: StudentViewModel
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(viewModel.students, id: \.id) { student in
                    VStack(alignment: .leading) {
                        NavigationLink(destination: StudentView(student: student)) {
                            Text(student.firstName + " " + student.secondName)
                        }
                        Divider()
                    }
                            .padding(.leading, 20)
                }
                        .animation(.default)
            }
        }
    }
}
