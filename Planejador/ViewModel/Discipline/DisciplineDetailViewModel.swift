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
            Discipline.Factory.shared.discipline(code: requirement.code) { result in
                switch result {
                case .success(let discipline):
                    self.discipline = discipline
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
