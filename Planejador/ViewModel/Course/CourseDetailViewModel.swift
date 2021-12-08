import SwiftUI

extension CourseDetailView {
    final class ViewModel: ObservableObject {
        @Published var course: Course

        init(_ course: Course) {
            self.course = course
        }
    }
}

extension DisciplineCell {
    final class ViewModel: ObservableObject {
        @Published var code: String
        @Published var discipline: Discipline?

        init(code: String) {
            self.code = code
            Discipline.Factory.shared.discipline(code: code) { result in
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
