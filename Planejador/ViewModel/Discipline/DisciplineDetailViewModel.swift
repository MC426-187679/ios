import SwiftUI

extension DisciplineDetailView {
    class ViewModel: ObservableObject {
        @Published var discipline: Discipline

        init(_ discipline: Discipline) {
            self.discipline = discipline
        }
    }
}
