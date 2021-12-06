import SwiftUI

extension RequirementCell {
    class ViewModel: ObservableObject {
        @Published var requirement: Requirement
        @Published var discipline: Discipline?

        init(requirement: Requirement) {
            self.requirement = requirement
            Discipline.Factory.shared.discipline(code: requirement.code) { discipline in
                self.discipline = discipline
            }
        }
    }
}
