import SwiftUI

extension CourseDetailView {
    class ViewModel: ObservableObject {
        @Published var course: Course

        init(_ course: Course) {
            self.course = course
        }
    }
}

extension DisciplineCell {
    class ViewModel: ObservableObject {
        @Published var code: String
        @Published var discipline: Discipline?

        init(code: String) {
            self.code = code
            Discipline.Factory.shared.discipline(code: code) { discipline in
                if let discipline = discipline {
                    self.discipline = discipline
                }
            }
        }
    }
}
