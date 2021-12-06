import SwiftUI

class DisciplinesInitialsViewModel: ObservableObject {
    @Published var initials: String
    @Published var disciplines = [Discipline]()

    init(initials: String) {
        self.initials = initials
        Discipline.Factory.shared.allDisciplines { allDisciplines in
            self.disciplines = allDisciplines.filter { discipline in
                discipline.code.starts(with: initials)
            }
        }
    }
}
