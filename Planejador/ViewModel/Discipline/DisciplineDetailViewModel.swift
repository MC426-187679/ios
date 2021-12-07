import SwiftUI

extension DisciplineDetailView {
    final class ViewModel: ObservableObject {
        @Published var discipline: Discipline

        init(_ discipline: Discipline) {
            self.discipline = discipline
        }
    }
}

extension RequirementCell {
    final class ViewModel: ObservableObject {
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
