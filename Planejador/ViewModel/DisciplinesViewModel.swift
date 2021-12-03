import SwiftUI

class DisciplinesViewModel: ObservableObject {
    @Published var allDisciplines = [Discipline]()

    init() {
        Discipline.allDisciplines { self.allDisciplines.append(contentsOf: $0) }
    }
}
