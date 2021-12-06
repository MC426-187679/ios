import SwiftUI

struct DisciplinesInitialsView: View {
    @ObservedObject private var viewModel: ViewModel

    init(initials: String) {
        self.viewModel = ViewModel(initials: initials)
    }

    var body: some View {
        Form {
            ForEach(viewModel.disciplines, id: \.self.code) { discipline in
                NavigationLink(destination: {
                    DisciplineDetailView(discipline)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                }, label: {
                    Text(discipline.code)
                })
            }
        }
        .navigationTitle("Disciplinas \(viewModel.initials)")
    }
}

struct DisciplinesInitialsView_Previews: PreviewProvider {
    static var previews: some View {
        DisciplinesInitialsView(initials: "MC")
    }
}
