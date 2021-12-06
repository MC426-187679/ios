import SwiftUI

class CoursesViewModel: ObservableObject {
    @Published var allCourses = [Course]()

    init() {
        Course.allCourses { self.allCourses.append(contentsOf: $0) }
    }
}
