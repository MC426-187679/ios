import SwiftUI

struct AllDisciplinesView: View {
    @ObservedObject private var viewModel = ViewModel()

    var body: some View {
        Form {
            ForEach(viewModel.initials, id: \.self) { initials in
                NavigationLink(destination: {
                    DisciplinesInitialsView(initials: initials)
                }, label: {
                    Text(initials)
                })
            }
        }
    }
}

struct AllDisciplinesView_Previews: PreviewProvider {
    static var previews: some View {
        AllDisciplinesView()
    }
}
