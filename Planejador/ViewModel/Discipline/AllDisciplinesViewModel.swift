import SwiftUI

class AllDisciplinesViewModel: ObservableObject {
    @Published var initials = Discipline.Factory.shared.disciplineNames
}
