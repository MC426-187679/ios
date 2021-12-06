import SwiftUI

extension AllDisciplinesView {
    class ViewModel: ObservableObject {
        @Published var initials = Discipline.Factory.shared.disciplineNames
    }
}
