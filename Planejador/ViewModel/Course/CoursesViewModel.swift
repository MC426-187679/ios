import SwiftUI

extension CoursesView {
    class ViewModel: ObservableObject {
        @Published var allCourses = [Course]()

        init() {
            Course.Factory.shared.allCourses { self.allCourses.append(contentsOf: $0) }
        }
    }
}
