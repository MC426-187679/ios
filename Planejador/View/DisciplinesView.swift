import SwiftUI

struct DisciplinesView: View {
    var body: some View {
        ItemsView<Discipline>()
    }
}

struct DisciplinesView_Previews: PreviewProvider {
    static var previews: some View {
        DisciplinesView()
    }
}
