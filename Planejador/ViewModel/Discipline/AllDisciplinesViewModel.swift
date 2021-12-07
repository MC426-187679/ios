import SwiftUI

extension AllDisciplinesView {
    final class ViewModel: ObservableObject {
        @Published var initials = Discipline.Factory.shared.disciplineNames
    }
}
