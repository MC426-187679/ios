import SwiftUI

struct DisciplinesView: View {
    @ObservedObject private var viewModel = DisciplinesViewModel()

    var body: some View {
        Form {
            ForEach(viewModel.allDisciplines, id: \.self.code) { discipline in
                NavigationLink(destination: {
                    Text("Item Page View")
                }, label: {
                    Text(discipline.code)
                })
            }
        }
    }
}

struct DisciplinesView_Previews: PreviewProvider {
    static var previews: some View {
        DisciplinesView()
    }
}
